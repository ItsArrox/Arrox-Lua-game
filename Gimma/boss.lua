boss = {
	x = 0,
	y = 0,
	w = 100,
	h = 150,
	health = 1000,
	x_start = 500,
	y_start = 100,
	x_rad = 400,
	y_rad = 120,
	t = 0,
	rotaties = 3,
	alive = true,
	speed = 0.002,
	physics = {
		velocity = {
			x = 0,
			y = 0
		},
	},
}

boss.update = function()
	
	player.frame = player.frame -1

	boss.x = boss.x_start+boss.x_rad*math.sin(boss.t+math.pi/2)
    boss.y = boss.y_start+100+boss.y_rad*math.sin(boss.rotaties*boss.t)
    boss.t = boss.t + boss.speed
    boss.x = boss.x + boss.physics.velocity.x
    if (boss.t >= 2*math.pi) then
      boss.t = boss.t - 2*math.pi
    end

    if         player.x + player.w >= boss.x
        and player.x < boss.x + boss.w
        and player.y + player.h >= boss.y
        and player.y < boss.y + boss.h
        and player.frame <= 0
        then
        player.health = player.health -10
        player.frame = 400
    end

end



boss.draw = function()
	love.graphics.rectangle(
		"fill",
		boss.x,
		boss.y,
		boss.w,
		boss.h
	)	
	love.graphics.setColor( 1, 0, 0 )

	love.graphics.rectangle(
		"fill",
		20,
		20,
		900,
		10
	)	

	love.graphics.setColor( 1, 1, 1 )

	love.graphics.rectangle(
		"line",
		20,
		20,
		900,
		10
	)	


	love.graphics.rectangle(
		"fill",
		20,
		20,
		boss.health *0.9,
		10
	)
end