-- vector
Vector = {}
Vector.__index = Vector

function Vector.new(x, y)
	return setmetatable({ x = x, y = y }, Vector)
end

function Vector:invertX()
	self.x = - self.x
end

function Vector:invertY()
	self.y = - self.y
end
