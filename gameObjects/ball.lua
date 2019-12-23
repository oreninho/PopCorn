Ball = Circle:extend()

function Ball:new(x, y, radius, velocityX, velocityY)
  Ball.super.new(self,x,y,radius)
  self.movmentVector = Vector.new(velocityX, velocityY)
end

function Ball:update(dt)
    self.x = self.x + self.movmentVector.x * dt
    self.y = self.y + self.movmentVector.y * dt
end

function Ball:draw()
    love.graphics.setColor(255, 0, 255, 255)
    self.super.draw(self)
end

function Ball:setPoint(x,y)
  self.x = x
  self.y = y
end

function Ball:setVelocity(velocityX, velocityY)
  self.movmentVector = Vector.new(velocityX, velocityY)
end

function Ball:objectCollisionCheck(object)
  if (self:bottom() >= object:top() and self.isOverlapingWith(self,object)) then
      return true
  end      
  return false
end

function Ball:frameAxisCollisionCheck()
  if (self:top()<=0) then
    return 'x'  
  elseif self:left()<=0 or self:right()>=love.graphics.getWidth() then
    return 'y'
  end
  return false  
end

function Ball:outOfFrame()
  return  self:top()>=love.graphics.getHeight() 
end

function Ball:changeBallVector(collisionAxis)
  if collisionAxis == 'x' then
    self.movmentVector.y = -self.movmentVector.y 
  else
    self.movmentVector.x = -self.movmentVector.x
  end
end    