player = {
		sprite =love.graphics.newImage("assets/characters/player.png") ,
		x = 20,
		y = 500,
		w = 50,
		h = 80,
		frame = 0,
		health = 100,
		direction = true,
		grounded = true,
		firerate = 0,
		physics = {
			velocity = {
				x = 0,
				y = 0
			},
			speed = 0.7,
			gravity = 0.03,
			jump_force = 3,
		},
	}

player.update = function()
	player.physics.velocity.x = 0
	spread = love.math.random(10, 40)

	

	-- Movement omhoog via de Y as
	if love.keyboard.isDown("space") and player.grounded == true then
		player.physics.velocity.y = -player.physics.jump_force
	end

	-- Jump
	if love.keyboard.isDown("w") and player.grounded == true then
		player.physics.velocity.y = -player.physics.jump_force
	end

	-- Movement links via de X as
	if love.keyboard.isDown("a") then
		player.physics.velocity.x = -player.physics.speed
		player.direction = true
	end

	-- Movement rechts via de X as
	if love.keyboard.isDown("d") then
		player.physics.velocity.x = player.physics.speed
		player.direction = false
	end
	-- Shoot
	if love.keyboard.isDown("r") and player.firerate < 0 then
		table.insert(
			projectiles,
			{
				x = player.x + spread,
				y = player.y + spread,
				w = 20,
				h = 3,
				shootdirection = player.direction

			}	
		)
		player.firerate = 75
	end

	if boss.health <= 0 then
		win = love.window.showMessageBox("you win", "congratulations you defeated the boss!", "info", true )
		love.event.quit()
end

	if player.health <= 0 then
		win = love.window.showMessageBox("try again", "you died. L", "error", true )
		love.event.quit()

	end
	player.firerate = player.firerate - 1 
	player.x = player.x + player.physics.velocity.x
	player.y = player.y + player.physics.velocity.y

end	


player.draw = function()
	love.graphics.draw(
			player.sprite,
			player.x,
			player.y,
			0,
			1.5,
			1.5
		)

	love.graphics.setColor( 1, 0, 0 )

	love.graphics.rectangle(
		"fill",
		player.x,
		player.y -20,
		50,
		10
	)	

	

	love.graphics.rectangle(
		"line",
		player.x,
		player.y -20,
		50,
		10
	)	

	love.graphics.setColor( 0, 1, 0 )

	love.graphics.rectangle(
		"fill",
		player.x,
		player.y -20,
		player.health *0.5,
		10
	)

	love.graphics.setColor( 1, 1, 1 )

end