require("lovepunk.entity")
PhysicsObject = Entity.new(0, 0, gs, gs)
PhysicsObject.__index = PhysicsObject

function PhysicsObject.new(x, y)
	local self = setmetatable({}, PhysicsObject)
	self.x = x
	self.y = y
	return self
end

function PhysicsObject:update(dt)
end
