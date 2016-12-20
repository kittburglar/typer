explosion = {}

local bulletMaxTime = 2
local smallBulletSize = 7

function explosion.load()
	for i,e in ipairs(explosion) do
        explosion[i] = nil
    end
end

function explosion.spawn(x, y, width, height, red, green, blue, speedlow, speedhigh, maxBullets, bulletTime)
	for i=1,maxBullets do
		table.insert(explosion, {
	        x = x,
	        y = y,
	        width = width,
	        height = height,
	        bulletSize = width,
	        red = red,
	        green = green,
	        blue = blue,
	        speed = helper.randomFloat(speedlow, speedhigh),
	        startTime = love.timer.getTime(),
	        direction = helper.randomFloat(-3.14, 3.14),
	        bulletTime = bulletTime
		})
	end
end

function explosion.update(dt)
	for i,explo in ipairs(explosion) do
		if love.timer.getTime() - explo.startTime >= explo.bulletTime then
		    table.remove(explosion, i)
		end
        explo.x = explo.x + math.cos(explo.direction) * explo.speed;
        explo.y = explo.y + math.sin(explo.direction) * explo.speed;
    end
end

function explosion.draw()
	for i,explo in ipairs(explosion) do
		love.graphics.setColor(explo.red,explo.green, explo.blue)
		explo.width = explo.bulletSize - (explo.bulletSize/explo.bulletTime * (love.timer.getTime() - explo.startTime))
		explo.height = explo.bulletSize - (explo.bulletSize/explo.bulletTime * (love.timer.getTime() - explo.startTime))
        love.graphics.rectangle("fill", explo.x, explo.y, explo.width , explo.height)
    end
end