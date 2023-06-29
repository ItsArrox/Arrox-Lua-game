require "player"
require "boss"
require "map"
require "bullet"

love.load = function()
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

	player.draw()
	boss.draw()
	map.draw()
	bullet.draw()

	--love.graphics.print(tostring(player.physics.grounded), 10, 10)
	--love.graphics.print(tostring(#projectiles), 10, 30)
end

function love.keypressed(key)
	
end	