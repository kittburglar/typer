explosion = {}

local bulletMaxTime = 2
local smallBulletSize = 7

function explosion.load()
	for i,e in ipairs(explosion) do
        explosion[i] = nil
    end
end

function explosion.spawn(x, y, red, green, blue, segments)
	for i=1,100 do
		table.insert(explosion, {
	        x = x,
	        y = y,
	        width = 5,
	        height = 5,
	        bulletSize = 5,
	        radius = 0, 
	        red = red,
	        green = green,
	        blue = blue,
	        speed = helper.randomFloat(2.00, 3.00),
	        segments = segments,
	        startTime = love.timer.getTime(),
	        direction = helper.randomFloat(-3.14, 3.14)
		})
	end

	for i=1,100 do
		table.insert(explosion, {
	        x = x,
	        y = y,
	        width = 7,
	        height = 7,
	        bulletSize = 7,
	        radius = 0, 
	        red = red,
	        green = green,
	        blue = blue,
	        speed = helper.randomFloat(0, 1),
	        segments = segments,
	        startTime = love.timer.getTime(),
	        direction = helper.randomFloat(-3.14, 3.14)
		})
	end
end

function explosion.update(dt)
	for i,explo in ipairs(explosion) do
		if love.timer.getTime() - explo.startTime >= bulletMaxTime then
		    table.remove(explosion, i)
		end
        explo.x = explo.x + math.cos(explo.direction) * explo.speed;
        explo.y = explo.y + math.sin(explo.direction) * explo.speed;
    end
end

function explosion.draw()
	for i,explo in ipairs(explosion) do
		love.graphics.setColor(explo.red,explo.green, explo.blue)
		explo.width = explo.bulletSize - (explo.bulletSize/2 * (love.timer.getTime() - explo.startTime))
		explo.height = explo.bulletSize - (explo.bulletSize/2 * (love.timer.getTime() - explo.startTime))
        love.graphics.rectangle("fill", explo.x, explo.y, explo.width , explo.height)
    end
end