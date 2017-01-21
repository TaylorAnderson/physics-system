require("lovepunk.scene")
require("test-controller")
require("test-platform")
gs = 64
TestScene = Scene.new()
TestScene.__index = TestScene --so when we reference a nil key, we just return ourselves.
function TestScene.new()
	local self = setmetatable({}, TestScene)
	self.entities = {}
	self.loaded = false
	return self
end
function TestScene:load()
	Scene.load(self)
	print("loaded")
	self:add(TestController.new(0, 0))
	self:add(TestPlatform.new(0, height-30, width, 30))
	self:add(TestPlatform.new(0, 0, 30, height))
end
function TestScene:update(dt)
	Scene.update(self, dt)
end
