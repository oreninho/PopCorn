-- Wall this class holds and manage the brick strcture, responsible for colision checking and reomving bricks if neccessary 

require 'gameConf'
Wall = Object:extend()
local patternsPerLevel = wallPatterns

function Wall:new(lvl,screenWidth,screenHeight,spacing)
  self.widthRatio = love.graphics.getWidth()/screenWidth
  self.heightRatio = love.graphics.getHeight()/screenHeight
  self.brickWall = {}
  self.brickMap = {{}}
  self.bricksNum = 0
  self.removedBricks = 0
    for i,j in pairs(patternsPerLevel[lvl]) do
      local x = j[1]*self.widthRatio
      local y = j[2]*self.heightRatio      
      if self.brickMap[j[1]] == nil then self.brickMap[j[1]] = {} end
      self.brickMap[j[1]][j[2]] = Brick(x,y,self.widthRatio-spacing,self.heightRatio-spacing)
      self.bricksNum = self.bricksNum+1
    end
end

function Wall:isNewLevelWallExists(lvl)
  return patternsPerLevel[lvl] ~= nil
end

function Wall:getPossibleCollisionBricks(possibleColisionPoint)
  local normY = math.floor(possibleColisionPoint.y/self.heightRatio)
  local normXLeft = math.floor(possibleColisionPoint.x/self.widthRatio)
  local normXRight = normXLeft + 1  -- in case it touches them both
  local touchedBricks = {}
  local idx = 1
  for i=normXLeft,normXRight do
    if self.brickMap[i] then
      if self.brickMap[i][normY] then
        touchedBricks[idx] = self.brickMap[i][normY]
        idx = idx+1
      end
    end
  end
  return touchedBricks
end

function Wall:removeBrickFromWall(x,y)
  local yNorm = math.floor(y/self.heightRatio)
  local xNorm = math.floor(x/self.widthRatio)
  self.brickMap[xNorm][yNorm] = nil
  self.bricksNum = self.bricksNum - 1 
  self.removedBricks = self.removedBricks + 1
end  

function Wall:noBricksLeft()
    return self.bricksNum == 0 and self.removedBricks>0
end

function Wall:draw()
    for i,brickLine in pairs(self.brickMap) do
      for j,brickInst in pairs(brickLine) do
        brickInst:draw()
      end      
    end
end