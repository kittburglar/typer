require "helper"
player = {}

function player.draw()
	love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
end

function player.load()
	player.width = 20
	player.height = 20
	player.x = love.graphics.getWidth()/2 - player.width/2
	player.y = love.graphics.getHeight()/2 - player.height/2
end

function player.update(dt)
	player.checkCollision()
end

function player.checkCollision()
	for i,e in ipairs(enemy) do
        if (helper.collisionDetection(e, player)) then
        	print("Player: Collision detected")
        	if health.wasUpdated == NO then
        		health.wasUpdated = YES
        	 	health.change(health.lifepoints - 1)
        	end
        end
    end
end