require("lovepunk.entity")
PhysicsObject = Entity.new(0, 0, 1, 1)
PhysicsObject.__index = PhysicsObject

function PhysicsObject.new(x, y, w, h)
	local self = setmetatable({}, PhysicsObject)
	self.x = x
	self.y = y
	self.width = w
	self.height = h
	self.v = {x=0, y=0}
	return self
end


function PhysicsObject:update(dt)
	self.x = self.x + self.v.x
	self.y = self.y + self.v.y
end
function PhysicsObject:addForce(vx, vy)
	self.v.x = self.v.x + vx
	self.v.y = self.v.y + vy
	for type, func in pairs(self.resolutions) do
		local _,_,cols = self.scene.bumpWorld:check(self, self.x, self.y)
		for _, col in pairs(cols) do
			if (col.other.type == type) then
				func(self, col)
			end
		end
	end
	self.scene.bumpWorld:update(self, self.x, self.y)
end
