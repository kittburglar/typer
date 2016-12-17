require "helper"
require "explosion"

player = {}

function player.draw()
	love.graphics.setColor(player.red,player.green,player.blue)
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
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
        		explosion.spawn(e.x, e.y, e.red, e.green, e.blue)
        		explosion.spawn(player.x, player.y, player.red, player.green, player.blue)
        	 	health.change(health.lifepoints - 1)
        	end
        end
    end
end