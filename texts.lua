require "points"

texts = {}

local maxShowTime = 1

function texts.load()
	for i,e in ipairs(texts) do
        texts[i] = nil
    end
end

function texts.spawn(x, y, red, green, blue, word)
	table.insert(texts, {
	        x = x-10,
	        y = y-10,
	        radius = 0, 
	        red = red,
	        green = green,
	        blue = blue,
	        word = word,
	        startTime = love.timer.getTime()
	})
end

function texts.update(dt)
	for i,text in ipairs(texts) do
		if love.timer.getTime() - text.startTime >= maxShowTime then
		    table.remove(texts, i)
		end
    end
end

function texts.draw()
	font = love.graphics.setNewFont("8-bit-wonder.ttf", 30)
	for i,text in ipairs(texts) do
		love.graphics.setColor(text.red,text.green, text.blue, 255 - (255*(love.timer.getTime() - text.startTime)))
        love.graphics.print(text.word, text.x - font:getWidth(text.word)/2, text.y - font:getHeight(text.word)/2, 0, 0.75 + (love.timer.getTime() - text.startTime) * .25, 0.75 + (love.timer.getTime() - text.startTime) * .25)
    	love.graphics.setColor(text.red,text.green, text.blue)
    end
end