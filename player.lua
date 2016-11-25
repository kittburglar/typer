player = {}

function player.draw()
	love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
end

function player.load()
	player.x = 200
	player.y = 200
	player.width = 20
	player.height = 20
end

function player.update(dt)
end