require "points"

scoretext = {}

local maxShowTime = 1

function scoretext.load()
	for i,e in ipairs(scoretext) do
        scoretext[i] = nil
    end
end

function scoretext.spawn(x, y, red, green, blue, point)
	table.insert(scoretext, {
	        x = x-10,
	        y = y-10,
	        radius = 0, 
	        red = red,
	        green = green,
	        blue = blue,
	        point = point * points.multiplier,
	        startTime = love.timer.getTime()
	})
end

function scoretext.update(dt)
	for i,score in ipairs(scoretext) do
		if love.timer.getTime() - score.startTime >= maxShowTime then
		    table.remove(scoretext, i)
		end
    end
end

function scoretext.draw()
	love.graphics.setNewFont("8-bit-wonder.ttf", 30)
	for i,score in ipairs(scoretext) do
		love.graphics.setColor(score.red,score.green, score.blue, 255 - (255*(love.timer.getTime() - score.startTime)))
        love.graphics.print(tostring(score.point), score.x - (love.timer.getTime() - score.startTime), score.y - (love.timer.getTime() - score.startTime), 0, 0.75 + (love.timer.getTime() - score.startTime) * .25, 0.75 + (love.timer.getTime() - score.startTime) * .25)
    	love.graphics.setColor(score.red,score.green, score.blue)
    end
end