Circle = Shape:extend()

function Circle:new(x, y, radius)
    Circle.super.new(self, x, y)
    self.radius = radius    
end

function Circle:draw()
    love.graphics.circle("fill", self.x, self.y, self.radius)
end

function Circle:top()
  return self.y-self.radius
end

function Circle:bottom()
  return self.y+self.radius
end

function Circle:left()
  return self.x-self.radius
end
function Circle:right()
  return self.x+self.radius
end
function Circle:middleX()
  return self.x
end
function Circle:middleY()
  return self.y
end
