
scene = nil;
love.window.setMode(800, 400)
require("testscene")

function love.load()
	changeScene(TestScene.new())
end
function love.update(dt)
	scene:update(dt)
end
function love.draw()
	love.graphics.scale(scale, scale)
	scene:draw()
end
function changeScene(newScene)
	scene = newScene
	scene:load()
end
