require = "explosion"
require = "enemy"

bomb = {}
bomb.bombpoints = 3
bomb.wasUpdated = NO
local bombpointspacing = 15

function bomb.draw()
	local i = 0
	while i < 3 do
		if i < bomb.bombpoints then
			love.graphics.setColor(bomb.red, bomb.green, bomb.blue)
			love.graphics.rectangle("fill", bombpointspacing + (bomb.width + bombpointspacing) * i, bomb.y, bomb.width, bomb.height)
		end
		love.graphics.setLineWidth(4)
		love.graphics.setColor(234,234,234)
		love.graphics.rectangle("line", bombpointspacing + (bomb.width + bombpointspacing) * i, bomb.y, bomb.width, bomb.height)
		
		i = i + 1
	end
end

function bomb.load()
	bomb.bombpoints = 3
	bomb.width = 30
	bomb.height = 30
	bomb.x = love.graphics.getWidth() - (bomb.bombpoints * bomb.width) - (bombpointspacing * bomb.bombpoints)
	bomb.y = bombpointspacing + 20
	bomb.red = 122
	bomb.green = 166
	bomb.blue = 218
end

function bomb.change(newbomb)
	bomb.wasUpdated = YES
	if newbomb <= 3 then
	    bomb.bombpoints = newbomb
	end
	bomb.wasUpdated = NO
end

function bomb.update(dt)
end

function bomb.keypressed(key)
	if bomb.bombpoints > 0 then
		explosion.spawn(player.x + player.width/2, player.y + player.height/2, 5, 5, player.red, player.green, player.blue, 15, 16, 100, 2)
	    
	    for i,e in ipairs(enemy) do
	    	for i = e.damageRecieved+1, e.healthpoints do
                local enemyColor = enemyColors[e.layers[i]]
                explosion.spawn(e.x + e.width/2, e.y + e.height/2, 5, 5, enemyColor[1], enemyColor[2], enemyColor[3], 2.00, 3.00, 100, 2)
            end
        enemy[i] = nil
    	end
    	bomb.change(bomb.bombpoints - 1)
    end	
end