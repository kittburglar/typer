require "player"
require "explosion"
require "points"

health = {}
health.wasUpdated = NO
local lifepointspacing = 15

function health.draw()
	local i = 0
	while i < 3 do
		if i < health.lifepoints then
			love.graphics.setColor(213,78,83)
			love.graphics.rectangle("fill", health.x + (health.width + lifepointspacing) * i, health.y, health.width, health.height)
		end
		love.graphics.setLineWidth(4)
		love.graphics.setColor(234,234,234)
		love.graphics.rectangle("line", health.x + (health.width + lifepointspacing) * i, health.y, health.width, health.height)
		i = i + 1
	end
end

function health.load()
	health.lifepoints = 1
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
		print("Current points are: ", points.currentPoints)
		highscore.add("testies", points.currentPoints)
		highscore.save()
	    main.gameover = true
	    explosion.spawn(player.x + player.width/2, player.y + player.height/2, 255, 255, 255)
	    player.width = 0
	    player.height = 0
	end
end