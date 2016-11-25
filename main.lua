
require "enemy"
require "player"

function love.draw()
    enemy.draw()
    player.draw()
end

function love.load()
	enemy.create(100, 100, 20, 20, 200, 40, 41, "hello")
	enemy.create(150, 100, 20, 20, 245, 135, 31, "poop")
	enemy.create(200, 100, 20, 20, 234, 183, 0, "world")
	enemy.create(250, 100, 20, 20, 113, 140, 0, "letter")
	enemy.create(300, 100, 20, 20, 62, 153, 159, "finished")
	enemy.create(350, 100, 20, 20, 137, 89, 168, "enemy")

	player.load()
end

function love.update(dt)
	enemy.update(dt)
end

function love.keypressed( key )
	enemy.keypressed(key)
end