require "helper"
require "explosion"
require "points"
require "bullet"

player = {}

function player.draw()
	-- love.graphics.setColor(player.red, player.green, player.blue)
 --    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
 --    love.graphics.setColor(112,192,177)
 --    love.graphics.rectangle("fill", player.x + player.width/2 - 10/2, player.y + player.height/2 - 10/2, 10, 10)
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(player.image, player.x, player.y, player.rotation, 1, 1, player.width/2, player.height/2, 0, 0)
end

function player.load()
	player.image = love.graphics.newImage("player.png")
	player.width = player.image:getWidth() 
	player.height = player.image:getHeight()
	print("player width is: ", player.width)
	player.x = love.graphics.getWidth()/2
	player.y = love.graphics.getHeight()/2 - 216 /2
	player.red = 234
	player.green = 234
	player.blue = 234
	player.rotation = 0
end

function player.update(dt)
	player.checkCollision()
end

function player.checkCollision()
	for i,e in ipairs(enemy) do
        if (helper.collisionDetection(e, player)) then
        	if health.wasUpdated == NO then
        		explosion.spawn(player.x + player.width/2, player.y + player.height/2, 3, 3, player.red, player.green, player.blue, 2.00, 3.00, 10, 2)
        		if e.word == "heal" then
                	health.change(health.lifepoints + 1)
            	elseif e.word == "bomb" then
                	bomb.change(bomb.bombpoints + 1)
            	else
        			health.change(health.lifepoints - 1)
        			
        			explosion.spawn(player.x + player.width/2, player.y + player.height/2, 5, 5, player.red, player.green, player.blue, 15, 16, 100, 2)
				    for i,e in ipairs(enemy) do
				        for j = e.damageRecieved+1, e.healthpoints do
			                local enemyColor = enemyColors[e.layers[j]]
			                explosion.spawn(e.x + e.width/2, e.y + e.height/2, 5, 5, enemyColor[1], enemyColor[2], enemyColor[3], 2.00, 3.00, 100, 2)
			            end
			        enemy[i] = nil
			    	end
        		end
        	 	
        	 	points.setMultiplier(1)
        	 	points.multKillCount = 0
        	end
        	enemy.remove(i)
        end
    end
end