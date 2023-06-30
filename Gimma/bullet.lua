bullet = {
	speed = 2
}
projectiles =  {}

bullet.update = function()
	-- PROJECTILES
	for i, projectile in pairs(projectiles) do
		if projectile.x > window_width or projectile.x < 0 then
			table.remove(
				projectiles,
				i
			)
		elseif projectile.shootdirection == false then 
			projectile.x = projectile.x + bullet.speed
		else
			projectile.x = projectile.x - bullet.speed
		end
	end

	for i, projectile in pairs(projectiles) do
		if  projectile.x + projectile.w >= boss.x
        and projectile.x < boss.x + boss.w
        and projectile.y + projectile.h >= boss.y
        and projectile.y < boss.y + boss.h
        and player.frame <= 0
        then

        	boss.health = boss.health -5
        	table.remove(
				projectiles,
				i
			)

        end
    end

end

bullet.draw = function()
love.graphics.setColor( 0, 0, 1 )
	for i, projectile in pairs(projectiles) do
		love.graphics.rectangle(
			"fill",
			projectile.x,
			projectile.y,
			projectile.w,
			projectile.h
			)

	end
	love.graphics.setColor( 1, 1, 1 )
end