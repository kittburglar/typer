require = "explosion"
require = "enemy"

bomb = {}
bomb.bombpoints = 3
bomb.wasUpdated = NO
local bombpointspacing = 15

function bomb.draw()
	local i = 0
	while i < bomb.bombpoints do
		love.graphics.setLineWidth(6)
		love.graphics.setColor(234,234,234)
		love.graphics.rectangle("line", bombpointspacing + (bomb.width + bombpointspacing) * i, bomb.y, bomb.width, bomb.height)
		love.graphics.setColor(122,166,218)
		love.graphics.rectangle("fill", bombpointspacing + (bomb.width + bombpointspacing) * i, bomb.y, bomb.width, bomb.height)
		i = i + 1
	end
end

function bomb.load()
	bomb.bombpoints = 3
	bomb.width = 30
	bomb.height = 30
	bomb.x = love.graphics.getWidth() - (bomb.bombpoints * bomb.width) - (bombpointspacing * bomb.bombpoints)
	bomb.y = bombpointspacing
end

function bomb.change(newbomb)
	bomb.wasUpdated = YES
	bomb.bombpoints = newbomb
	bomb.wasUpdated = NO
end

function bomb.update(dt)
end

function bomb.keypressed(key)
	if bomb.bombpoints > 0 then
		explosion.spawn(player.x + player.width/2, player.y + player.height/2, 234,234,234)
	    for i,e in ipairs(enemy) do
        explosion.spawn(e.x + e.width/2, e.y + e.height/2, e.red, e.green, e.blue)
        enemy[i] = nil
    	end
    	bomb.change(bomb.bombpoints - 1)
    end	
end