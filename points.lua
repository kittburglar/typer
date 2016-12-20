points = {}
points.wasUpdated = NO
points.multKillCount = 0
points.multiplierKillNeeded = 2
function points.load()
	points.currentPoints = 0
	points.multiplier = 1
end

function points.draw()
	w = love.graphics.getWidth()
	love.graphics.setNewFont(30)
	love.graphics.setColor(234,234,234)
	love.graphics.setNewFont("8-bit-wonder.ttf", w/20)
	love.graphics.printf(string.format("%s", points.currentPoints), 0, 30, w, "center")
	love.graphics.setNewFont("8-bit-wonder.ttf", w/25)
	love.graphics.printf(string.format("x%s", points.multiplier), 0, 60, w, "center")
end

function points.changed(newPoints)
	if points.wasUpdated == NO then
	    points.wasUpdated = YES
		points.currentPoints = points.currentPoints + (newPoints * points.multiplier)
		points.wasUpdated = NO
	end
end

function points.setMultiplier(newMultiplier)
	points.multiplier = newMultiplier
end