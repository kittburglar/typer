require "helper"
require "explosion"
require "points"

player = {}

function player.draw()
	love.graphics.setColor(player.red, player.green, player.blue)
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
    love.graphics.setColor(112,192,177)
    love.graphics.rectangle("fill", player.x + player.width/2 - 10/2, player.y + player.height/2 - 10/2, 10, 10)
end

function player.load()
	player.width = 25 * (love.graphics.getWidth() / 600)
	player.height = 25 * (love.graphics.getWidth() / 600)
	print(love.graphics.getWidth())
	player.x = love.graphics.getWidth()/2 - player.width/2 
	player.y = love.graphics.getHeight()/2 - player.height/2 - 216 /2
	player.red = 234
	player.green = 234
	player.blue = 234
end

function player.update(dt)
	player.checkCollision()
end

function player.checkCollision()
	for i,e in ipairs(enemy) do
        if (helper.collisionDetection(e, player)) then
        	enemy.remove(i)
        	if health.wasUpdated == NO then
        		explosion.spawn(e.x + e.width/2, e.y + e.height/2, 5, 5, e.red, e.green, e.blue, 2.00, 3.00, 100, 2)
            	explosion.spawn(e.x + e.width/2, e.y + e.height/2, 7, 7, e.red, e.green, e.blue, 0, 1, 10, 2)
        		explosion.spawn(player.x + player.width/2, player.y + player.height/2, 3, 3, player.red, player.green, player.blue, 2.00, 3.00, 10, 2)
        		if e.word == "heal" then
                	health.change(health.lifepoints + 1)
            	elseif e.word == "bomb" then
                	bomb.change(bomb.bombpoints + 1)
            	else
        			health.change(health.lifepoints - 1)
        		end
        	 	
        	 	points.setMultiplier(1)
        	 	points.multKillCount = 0
        	end
        end
    end
end