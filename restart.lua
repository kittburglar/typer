require "points"

restart = {}

function restart.load()
	restart.wordCorrectSoFar = "r"
	restart.red = 234
	restart.green = 234
	restart.blue = 234
	restart.height = 50
	restart.wordRemaining = "estart"
	restart.word = "restart"
	restart.x = 0
	restart.y = (love.graphics.getHeight() - 216)/2

end

function restart.draw()
	w = love.graphics.getWidth()
	padding = love.graphics.getHeight() / 16
	h = love.graphics.getHeight() - 216 - (2 * padding)
	offset = 20
	love.graphics.setNewFont("8-bit-wonder.ttf", love.graphics.getWidth()/10)
	love.graphics.setColor(234,234,234)
	love.graphics.printf({{213,78,83}, restart.wordCorrectSoFar, {234,234,234}, restart.wordRemaining} , restart.x, (3*h)/4 + padding + offset, w, "center")
	love.graphics.setColor(213,78,83)
	love.graphics.printf("GAME OVER", 0, padding + offset, w, "center")
	
	for i, score, name in highscore() do
	    love.graphics.printf({{213,78,83}, name, {213,78,83}, " ", {234,234,234}, score} , restart.x, (1*h)/4 + padding +offset, w, "center")
	end
	love.graphics.printf({{213,78,83}, "Score ", {234,234,234}, points.currentPoints} , restart.x, (2*h)/4 + padding + offset, w, "center")

	love.graphics.setNewFont(40)
end

function restart.keypressed(key)
	local restartFirstLetter = restart.wordRemaining:sub(0, 1)
	print("Key pressed is ", key, "restart first letter is: ", restartFirstLetter)
    if restartFirstLetter == key then
        local restOfEnemyWord = restart.wordRemaining:sub(2, string.len(restart.wordRemaining))
        restart.wordCorrectSoFar = restart.wordCorrectSoFar .. key
        restart.wordRemaining = restOfEnemyWord
        -- print("Key pressed is ", key, " correct so far is is: ", restart.wordCorrectSoFar, " word remaining is ", restart.wordRemaining)
    else 
        restart.wordCorrectSoFar = " "
        restart.wordRemaining = restart.word
    end

    if restart.wordRemaining == "" then
        love.load()
        music:rewind()
    end
end