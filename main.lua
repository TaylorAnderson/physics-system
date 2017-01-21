
scene = nil;
width=800
height=400
love.window.setMode(width, height)
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
