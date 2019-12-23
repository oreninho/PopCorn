Brick = Rectangle:extend()

function Brick:new(x, y, width, height)
  Brick.super.new(self, x, y,width,height)
end

function Brick:draw()
    love.graphics.setColor(100, 100, 0, 255)    
    self.super.draw(self)
end

function Brick:remove()
  self.width=0
  self.height=0
end