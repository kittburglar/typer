
require "enemy"
require "player"
require "health"

main = {}

function love.draw()
    enemy.draw()
    player.draw()
    health.draw()
    explosion.draw()
    if main.gameover then
    	w = love.graphics.getWidth()
    	love.graphics.setNewFont(100)
		love.graphics.printf("GAME OVER :(", 0, love.graphics.getHeight()/2 - 100, w, "center")
	end

end

function love.load()
	main.gameover = false;
	

	enemy.create(100, 100, 20, 20, 200, 40, 41, "hello")
	enemy.create(150, 100, 20, 20, 245, 135, 31, "poop")
	enemy.create(200, 100, 20, 20, 234, 183, 0, "world")
	enemy.create(250, 100, 20, 20, 113, 140, 0, "letter")
	enemy.create(300, 100, 20, 20, 62, 153, 159, "finished")
	enemy.create(350, 100, 20, 20, 137, 89, 168, "enemy")

	player.load()
	health.load()
end

function love.update(dt)
	print("IS GAMEOVER?", main.gameover)
	if not main.gameover then
		enemy.update(dt)
		player.update(dt)
		health.update(dt)
		explosion.update(dt)
	end
	
end

function love.keypressed( key )
	enemy.keypressed(key)
end