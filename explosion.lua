explosion = {}

function explosion.spawn(x, y, red, green, blue)
	print("spawning explosions!!!")
	table.insert(explosion, {
	        x = x,
	        y = y,
	        radius = 0, 
	        red = red,
	        green = green,
	        blue = blue
	})
end

function explosion.update(dt)
	for i,explo in ipairs(explosion) do
        explo.radius = explo.radius + 10
    end
end

function explosion.draw()
	-- print("explosion coloru is,", e.red, e.green)
	for i,explo in ipairs(explosion) do
		print(explo)
		love.graphics.setColor(explo.red,explo.green, explo.blue)
        love.graphics.circle("line", explo.x, explo.y, explo.radius, 100)
    end
end