

health = {}
health.lifepoints = 3
health.wasUpdated = NO
local lifepointspacing = 15

function health.draw()
	local i = 0
	while i < health.lifepoints do
		love.graphics.setLineWidth(6)
		love.graphics.setColor(234,234,234)
		love.graphics.rectangle("line", health.x + (health.width + lifepointspacing) * i, health.y, health.width, health.height)
		love.graphics.setColor(213,78,83)
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
	if health.lifepoints <= 0 then
	    main.gameover = true
	end
end