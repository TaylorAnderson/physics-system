require("lovepunk.entity")
PhysicsObject = Entity.new(0, 0, gs, gs)
PhysicsObject.__index = PhysicsObject

function PhysicsObject.new(x, y)
	local self = setmetatable({}, PhysicsObject)
	self.x = x
	self.y = y
	resolutions = {}
	return self
end

function PhysicsObject:update(dt)
	self.x = self.x + self.v.x
	self.y = self.y + self.v.y
end
function PhysicsObject:addForce(force)
	self.v.x = self.v.x + force.x
	self.v.y = self.v.y + force.y
	for i, v in pairs(resolutions) do
		if (self:collide(i, self.x + self.v.x, self.y + self.v.y)) then
			--TODO: add more detail to collide function so we can grab normal, pretty important
		end
	end
end
