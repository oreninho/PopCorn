Rectangle = Shape:extend()

function Rectangle:new(x, y, width, height)
    Rectangle.super.new(self, x, y)
    self.width = width
    self.height = height
end

function Rectangle:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
function Rectangle:top()
  return self.y
end

function Rectangle:bottom()
  return self.y+self.height
end

function Rectangle:left()
  return self.x
end
function Rectangle:right()
  return self.x+self.width
end
function Rectangle:middleX()
  return self.x+self.width/2
end
function Rectangle:middleY()
  return self.y+self.height/2
end