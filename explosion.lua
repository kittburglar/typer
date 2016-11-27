explosion = {}

function explosion.load()
	for i,e in ipairs(explosion) do
        explosion[i] = nil
    end
end

function explosion.spawn(x, y, red, green, blue, segments)
	table.insert(explosion, {
	        x = x,
	        y = y,
	        radius = 0, 
	        red = red,
	        green = green,
	        blue = blue,
	        segments = segments
	})
end

function explosion.update(dt)
	for i,explo in ipairs(explosion) do
		if explo.radius >= love.graphics.getWidth() then
		    table.remove(explosion, i)
		end
        explo.radius = explo.radius + 10
    end
end

function explosion.draw()
	for i,explo in ipairs(explosion) do
		love.graphics.setColor(explo.red,explo.green, explo.blue)
        love.graphics.circle("line", explo.x, explo.y, explo.radius, explo.segments)
    end
end