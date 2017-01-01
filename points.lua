points = {}
points.wasUpdated = NO
points.multKillCount = 0
points.multiplierKillNeeded = 5
function points.load()
	points.currentPoints = 0
	points.multiplier = 1
	w = love.graphics.getWidth()
	font = love.graphics.newFont("8-bit-wonder.ttf", w/20)
	font2 = love.graphics.newFont("8-bit-wonder.ttf", w/25)
end

function points.draw()
	love.graphics.setColor(234,234,234)
	love.graphics.setFont(font)
	love.graphics.printf(string.format("%s", points.currentPoints), 0, 30, w, "center")
	love.graphics.setFont(font2)
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