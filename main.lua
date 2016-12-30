require "sick"
require "restart"
require "enemy"
require "player"
require "health"
require "points"
require "texts"
require "bullet"
require "keyboard"
require "bomb"



main = {}
local background = {}
music = love.audio.newSource("signed.mp3")
local timer

function love.draw()
	love.graphics.setColor(255, 255, 255)
	

	for i = 0, love.graphics.getWidth() / backgroundImage:getWidth() do
        for j = 0, love.graphics.getHeight() / backgroundImage:getHeight() do
            love.graphics.draw(backgroundImage, i * backgroundImage:getWidth(), j * backgroundImage:getHeight())
        end
    end

   
    
    if main.gameover then
    	restart.draw()
    	explosion.draw()
    else
    	bullet.draw()
    	enemy.draw()
	    player.draw()
    	explosion.draw()
	    texts.draw()
	    health.draw()
	    bomb.draw()
	    points.draw()
	end

    keyboard.draw()
     -- Status bar on iOS
    love.graphics.setColor(234,234,234)
	love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), 20)
	love.graphics.setColor(255, 255, 255)
end

function love.load()

	-- love.window.setMode(320, 480)
	love.window.setMode(414, 736)

	table.insert(background, love.graphics.newImage("background.png"))
	table.insert(background, love.graphics.newImage("background2.png"))
	table.insert(background, love.graphics.newImage("background3.png"))
	table.insert(background, love.graphics.newImage("background4.png"))
	table.insert(background, love.graphics.newImage("background5.png"))
	table.insert(background, love.graphics.newImage("background6.png"))
	table.insert(background, love.graphics.newImage("background7.png"))
	table.insert(background, love.graphics.newImage("background8.png"))

	keyboard.load()
	main.gameover = false;
	enemy.load()
	math.randomseed(os.time())
	restart.load()
	player.load()
	health.load()
	points.load()
	bomb.load()
	explosion.load()
	texts.load()
	music:setVolume(0.5)
	music:setLooping(true)
	music:play()
	timer = 0
	highscore.set("highscore", 1, "Best", 0)
end

function love.update(dt)
	-- love.keyboard.setTextInput(true)
	timer = timer + dt * 7
	backgroundImage = background[1 + math.floor(timer) % 8]
	if not main.gameover then
		enemy.spawnCheck()
		enemy.update(dt)
		player.update(dt)
		health.update(dt)	
		bullet.update(dt)
	end
	keyboard.update(dt)
	explosion.update(dt)
	texts.update(dt)
end

function love.keypressed( key )
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