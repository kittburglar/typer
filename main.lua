
require "enemy"

function love.draw()
    love.graphics.print("Hello World", 400, 300)
    enemy.draw()
end

function love.load()
	enemy.create(100, 100, 20, 20)
end

function love.update(dt)
	enemy.update(dt)
end