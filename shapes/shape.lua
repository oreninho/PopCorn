Shape = Object:extend()

function Shape:new(x, y)
    self.x = x
    self.y = y
end

function Shape:getX()
  return self.x
end

function Shape:getY()
  return self.y
end

function Shape:isOverlapingWith(shape)
    return (self:left()>shape:left() and self:left()<shape:right()) or ( shape:left() >  self:left() and shape:left()<self:right() )
end

function Shape:top() end
function Shape:right() end
function Shape:left() end
function Shape:bottom() end