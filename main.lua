
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

	math.randomseed(os.time())
	enemy.randomCreate()
	enemy.randomCreate()
	enemy.randomCreate()
	enemy.randomCreate()

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