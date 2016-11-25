

health = {}
health.lifepoints = 3
health.wasUpdated = NO
local lifepointspacing = 15

function health.draw()
	local i = 0
	while i < health.lifepoints do
		print("Lifepoints are: " .. i)
		love.graphics.setLineWidth(6)
		love.graphics.setColor(255, 255, 255)
		love.graphics.rectangle("line", health.x + (health.width + lifepointspacing) * i, health.y, health.width, health.height)
		love.graphics.setColor(200, 40, 41)
		love.graphics.rectangle("fill", health.x + (health.width + lifepointspacing) * i, health.y, health.width, health.height)
		i = i + 1
	end
end

function health.load()
	health.lifepoints = 3
	health.width = 30
	health.height = 30
	health.x = love.graphics.getWidth() - (health.lifepoints * health.width) - (lifepointspacing * health.lifepoints)
	health.y = lifepointspacing
end

function health.change(newHealth)
	health.wasUpdated = YES
	health.lifepoints = newHealth
	health.wasUpdated = NO
end

function health.update(dt)
	print("Health lfiepoitns are: " .. health.lifepoints)
	if health.lifepoints <= 0 then
		print("GAMEOVEr")
	    main.gameover = true
	end
end