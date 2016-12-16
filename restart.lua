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
	restart.y = love.graphics.getHeight()/2

end

function restart.draw()
	w = love.graphics.getWidth()
	love.graphics.setNewFont("8-bit-wonder.ttf", 100)
	love.graphics.setColor(234,234,234)
	love.graphics.printf({{213,78,83}, restart.wordCorrectSoFar, {234,234,234}, restart.wordRemaining} , restart.x, restart.y + restart.height, w, "center")
	love.graphics.setColor(213,78,83)
	love.graphics.printf("GAME OVER", 0, love.graphics.getHeight()/2 - 100, w, "center")
	
	for i, score, name in highscore() do
	    love.graphics.printf({{213,78,83}, name, {234,234,234}, score} , restart.x, restart.y + restart.height + 100, w, "center")
	end
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