
require "enemy"
require "player"
require "health"
require "points"

main = {}

function love.draw()
    enemy.draw()
    player.draw()
    health.draw()
    explosion.draw()
    points.draw()
    if main.gameover then
    	w = love.graphics.getWidth()
    	love.graphics.setNewFont(100)
		love.graphics.printf("GAME OVER :(", 0, love.graphics.getHeight()/2 - 100, w, "center")
	end

end

function love.load()
	main.gameover = false;
	
	enemy.load()
	math.randomseed(os.time())

	player.load()
	health.load()
	points.load()
end

function love.update(dt)
	if not main.gameover then
		
		enemy.spawnCheck()
		enemy.update(dt)
		player.update(dt)
		health.update(dt)
		explosion.update(dt)
	end
	
end

function love.keypressed( key )
	enemy.keypressed(key)
end