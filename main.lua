
require "restart"
require "enemy"
require "player"
require "health"
require "points"
require "bomb"


main = {}
music = love.audio.newSource("signed.mp3")

function love.draw()
	for i = 0, love.graphics.getWidth() / background:getWidth() do
        for j = 0, love.graphics.getHeight() / background:getHeight() do
            love.graphics.draw(background, i * background:getWidth(), j * background:getHeight())
        end
    end

    enemy.draw()
    player.draw()
    health.draw()
   
    explosion.draw()
    points.draw()
    bomb.draw()
    if main.gameover then
    	restart.draw()
	end

end

function love.load()
	background = love.graphics.newImage("background.png")

	main.gameover = false;
	
	enemy.load()
	math.randomseed(os.time())
	restart.load()
	player.load()
	health.load()
	points.load()
	bomb.load()
	explosion.load()
	
	music:setVolume(0.5)
	music:play()
end

function love.update(dt)
	if not main.gameover then
		
		enemy.spawnCheck()
		enemy.update(dt)
		player.update(dt)
		health.update(dt)
		
	end
	explosion.update(dt)
end

function love.keypressed( key )
	enemy.keypressed(key)
	if key == "space" then
	 	bomb.keypressed(key)
	end
	if key == "2" then
	    love.load()
	end

	if main.gameover then
	    restart.keypressed(key)
	end
end