require "player"
require "boss"
require "map"
require "bullet"

love.load = function()
	background = love.graphics.newImage("assets/environment/background.jpg")
	window_width, window_height = love.graphics.getDimensions()
	sounds.music:play()
end

love.update = function()
	player.update()
	boss.update()
	map.update()
	bullet.update()
	
end

love.draw = function()
	for i = 0, love.graphics.getWidth() / background:getWidth() do
        for j = 0, love.graphics.getHeight() / background:getHeight() do
            love.graphics.draw(background, i * background:getWidth(), j * background:getHeight())
        end
    end
	player.draw()
	boss.draw()
	map.draw()
	bullet.draw()

	--love.graphics.print(tostring(player.physics.grounded), 10, 10)
	--love.graphics.print(tostring(#projectiles), 10, 30)
end

function love.keypressed(key)
	
end	