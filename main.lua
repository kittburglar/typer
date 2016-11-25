
require "enemy"
require "player"

function love.draw()
    enemy.draw()
    player.draw()
end

function love.load()
	enemy.create(100, 100, 20, 20)
	player.load()
end

function love.update(dt)
	enemy.update(dt)
end