points = {}
points.wasUpdated = NO

function points.load()
	points.currentPoints = 0
end

function points.draw()
	w = love.graphics.getWidth()
	love.graphics.setNewFont(30)
	love.graphics.printf(string.format("%s", points.currentPoints), 0, 25, w, "center")
end

function points.changed(newPoints)
	points.wasUpdated = YES
	points.currentPoints = newPoints
	points.wasUpdated = NO
end