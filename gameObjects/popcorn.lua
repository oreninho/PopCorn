----- This class handles the game logic ----
require 'gameConf'
local config = gameConfig
Popcorn = Object:extend()

function Popcorn:new()
  self.pause = false        
  self.level = config.startLevel
  self.strikesLeft = config.strikesLeft
  self:initLevel()
end

function Popcorn:draw()
  self.ball:draw()
  self.paddle:draw()
  self.wall:draw()
end

-- the main function, run the game flow
function Popcorn:runGame(dt) 
    if self.pause then      
      return false -- incase of prompt or user intiated pause
    end
    self.paddle:update()
    self.ball:update(dt)    
    self:handleBallCollisions()  
    if self.ball:outOfFrame() then       
      self:handleOutOfFrame()           
    end
  if self:isLevelFinnished() then  
    if self:isGameFinnished() then
      self:handleGameFinnished()
    end
    self:handleLevelFinished() 
  end 
  return true -- game runs ok
end

function Popcorn:isGameFinnished()
      return not self.wall:isNewLevelWallExists(self.level+1)
end

function Popcorn:handleOutOfFrame()
  self.pause = true
  self:initBall()
  self.strikesLeft = self.strikesLeft-1     
  if self.strikesLeft < 0 then
    self:promptMessage('Game Over!','you have used all of your strikes, goodBye!')    
    love.event.quit()
  else    
    self:promptMessage('OH NO','Ball fell out of frame, try again')      
    self:askUserToResumeGame()
  end        
end

function Popcorn:handleGameFinnished()
  self:promptMessage("Congrats!","You have finnished the game! Well done :-) ") 
  love.event.quit()
end

function Popcorn:handleLevelFinished()
  self.pause = true        
  self.level = self.level+1        
  self:initLevel() 
  self:askUserToResumeGame()
  return self:promptMessage("Level finnished !!!","Press OK to load next level ") 
end

function Popcorn:isGamePaused()
  return self.pause
end

function Popcorn:unpause()
  self.pause = false
end

function Popcorn:askUserToResumeGame()
    return self:promptMessage("resuming game","hit 'enter' to resume gane") 
end

function Popcorn:initBall()
  self.ball:setPoint(config.ballInitialLocationX,config.ballInitialLocationY)
  self.ball:setVelocity(config.ballVx,config.ballVy)
end

function Popcorn:isLevelFinnished()
  return self.wall:noBricksLeft() 
end

function Popcorn:initLevel()
  self.ball = Ball(config.ballInitialLocationX,config.ballInitialLocationY,config.ballRadius,config.ballVx,config.ballVy)
  self.paddle = Paddle(config.paddleStartX,config.paddleStartY,config.paddleWidth,config.paddleHeight)
  self.wall = Wall(self.level,config.screenWidth,config.screenHeight,config.spacing)  
end

function Popcorn:promptMessage(title,message)
  local buttons = {"OK",escapebutton = 2}
  return love.window.showMessageBox(title, message, buttons,"info",true)
end

function Popcorn:handleBallCollisions()
  local axis = self.ball:frameAxisCollisionCheck() -- check the most common collision as I see it (with the frame) 
  if axis == false then
    -- this means the ball didn't hit any axis
    if self.ball:objectCollisionCheck(self.paddle) or (self:handleWallCollision())   then 
       self.ball:changeBallVector('x')
    end
  else
    self.ball:changeBallVector(axis)        
  end
end

function Popcorn:handleWallCollision()
  local touchedBricks = self.wall:getPossibleCollisionBricks({y = self.ball:top(),x=self.ball:middleX()})
  local brickTouched = false
  for i,brick in pairs(touchedBricks) do    
    if self.ball:objectCollisionCheck(brick) then
      self.wall:removeBrickFromWall(brick:getX(),brick:getY())      
      brick:remove()      
      brickTouched = true
    end              
  end
  return brickTouched
end