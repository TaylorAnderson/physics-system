require("lovepunk.entity")
require("physicsobject")
TestPlatform = PhysicsObject.new(0, 0, 800, 100)
TestPlatform.__index = TestPlatform

function TestPlatform.new(x, y)
	local self = setmetatable({}, TestPlatform)
	self.x = x
	self.y = y - self.height
	self.type = "level"
	self.resolutions = {}
	return self
end

function TestPlatform:draw()
	love.graphics.setColor(50, 50, 100, 255)
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
