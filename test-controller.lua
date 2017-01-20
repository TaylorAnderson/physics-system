require("lovepunk.entity")
require("physicsobject")
require("helpfuldog")
TestController = PhysicsObject.new(0, 0, 64, 64)
TestController.__index = TestController

function TestController.new(x, y)
	local self = setmetatable({}, TestController)
	self.x = x
	self.y = y
	self.resolutions = {["level"]=hitLevel}
	return self
end


function TestController:update(dt)
	self:addForce(0, 0.1)

	if (pressing("left")) then self:addForce(2, 0) end
	if (pressing("right")) then self:addForce(-2, 0) end
	if (pressing("up")) then self:addForce(0, -2) end
	PhysicsObject.update(self)
end

function TestController:draw()
	love.graphics.setColor(50, 50, 100, 255)
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
function hitLevel(self, col)
	self:addForce(col.normal.x*math.abs(self.v.x), col.normal.y*math.abs(self.v.y))
end
