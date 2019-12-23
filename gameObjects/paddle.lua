Paddle = Rectangle:extend()

function Paddle:new(x, y, width, height)
  Paddle.super.new(self, x, y,width,height)
end

function Paddle:draw()
    love.graphics.setColor(255, 255, 255, 255)
    self.super.draw(self)
end


function Paddle:update(dt)
	mouseX, _ = love.mouse.getPosition()
  self.x = mouseX - self.width/2

    if self:left() <= 0 then
        self.x = 0
    elseif self:right() >= love.graphics.getWidth() then
        self.x = love.graphics.getWidth() - self.width
    end
end
