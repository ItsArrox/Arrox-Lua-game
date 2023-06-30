zoetwaterpiraat = {
	sprite = love.graphics.newImage("assets/characters/zoetwaterpiraat.png"),
		x = 500,
		y = 370,
		w = 130,
		h = 300,
		s = 4,
		animations = {
			current_quad = 1,
			idle = {
				{
					x = 0,
					y = 0
				},
				{
					x = 32,
					y = 0
				},
				{
					x = 64,
					y = 0
				},
				{
					x = 96,
					y = 0
				},
				{
					x = 128,
					y = 0
				},
				{
					x = 160,
					y = 0
				}
			}
		}
}
zoetwaterpiraat.sprite:setFilter("nearest", "nearest")
zoetwaterpiraat.quad = love.graphics.newQuad(
	zoetwaterpiraat.animations.idle[zoetwaterpiraat.animations.current_quad].x,
	zoetwaterpiraat.animations.idle[zoetwaterpiraat.animations.current_quad].y,
	32, 
	32,
	zoetwaterpiraat.sprite
)
zoetwaterpiraat.update = function()
 -- ANIMATIONS
	if 	zoetwaterpiraat.animations.current_quad >= #zoetwaterpiraat.animations.idle then
		zoetwaterpiraat.animations.current_quad = 1
	else
		zoetwaterpiraat.animations.current_quad = zoetwaterpiraat.animations.current_quad + 1
	end
	zoetwaterpiraat.quad = love.graphics.newQuad(
	zoetwaterpiraat.animations.idle[zoetwaterpiraat.animations.current_quad].x,
	zoetwaterpiraat.animations.idle[zoetwaterpiraat.animations.current_quad].y,
	32, 
	32,
	zoetwaterpiraat.sprite
)
end


zoetwaterpiraat.draw = function()
	love.graphics.draw(
		zoetwaterpiraat.sprite,
		zoetwaterpiraat.quad,
		love.math.newTransform(
			zoetwaterpiraat.x,
			zoetwaterpiraat.y,
			0,
			zoetwaterpiraat.s,
			zoetwaterpiraat.s
			)
	)
end