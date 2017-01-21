require("lovepunk.entity")
require("physicsobject")
require("helpfuldog")
TestController = PhysicsObject.new(0, 0, 64, 64)
TestController.__index = TestController

function TestController.new(x, y)
	local self = setmetatable({}, TestController)
	self.x = x
	self.y = y
	self.filters = {["level"]="slide"}
	self.gravity = 1
	return self
end


function TestController:update(dt)
	self.v.y = self.v.y + self.gravity

	if (pressing("left")) then self.v.x = self.v.x - 1 end
	if (pressing("right")) then self.v.x = self.v.x + 1 end
	if (pressing("up") and self:collide("level", self.x, self.y+1)) then self.v.y = self.v.y - 20 end
	self.v.x = self.v.x * 0.9

	PhysicsObject.update(self)
end

function TestController:draw()
	love.graphics.setColor(50, 50, 100, 255)
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
