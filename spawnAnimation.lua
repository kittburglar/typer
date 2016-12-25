spawnAnimation = {}

local bulletMaxTime = 2
local smallBulletSize = 7

function spawnAnimation.load()
	for i,e in ipairs(spawnAnimation) do
        spawnAnimation[i] = nil
    end
end

function spawnAnimation.spawn(x, y, radius, red, green, blue, speed, repeatAmount)
	for i=1,repeatAmount do
		table.insert(spawnAnimation, {
	        x = x,
	        y = y,
	        radius = radius,
	        red = red,
	        green = green,
	        blue = blue,
	        speed = speed + i,
	        startTime = love.timer.getTime()
		})
	end
end

function spawnAnimation.update(dt)
	for i,s in ipairs(spawnAnimation) do
		if love.timer.getTime() - s.startTime >= .5 then
		    table.remove(spawnAnimation, i)
		end
        s.radius = s.radius + s.speed
    end
end

function spawnAnimation.draw()
	for i,s in ipairs(spawnAnimation) do
		love.graphics.setColor(s.red,s.green, s.blue)
        love.graphics.circle("line", s.x, s.y, s.radius, 4)
        love.graphics.setColor(255, 255, 255)
    end
end