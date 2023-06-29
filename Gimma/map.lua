map = {}
sounds = {}
sounds.music = love.audio.newSource("magicbattle.mp3", "stream")
platform = {
		x = 400,
		y = 500,
		w = 200,
		h = 20
	}

map.update = function()
	if player.y >= window_height - player.h or (
			player.physics.velocity.y >= 0
			and player.x + player.w > platform.x
			and player.x < platform.x + platform.w
			and player.y + player.h > platform.y
			and player.y + player.h - 1 < platform.y + platform.h
		) then
		player.physics.velocity.y = 0
		player.grounded = true
	else
		player.physics.velocity.y = player.physics.velocity.y + player.physics.gravity
		player.grounded = false
	end
end	

map.draw = function()
	love.graphics.rectangle(
		"fill",
		platform.x,
		platform.y,
		platform.w,
		platform.h
	)
end