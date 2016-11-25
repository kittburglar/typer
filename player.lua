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

end