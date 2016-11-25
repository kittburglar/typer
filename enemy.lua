enemy = {}

function enemy.create(x, y, width, height, red, green, blue, word)
    table.insert(enemy, {
        x = x,
        y = y,
        width = width,
        height = height,
        word = word,
        wordCorrectSoFar = " ",
        wordRemaining = word,
        red = red,
        green = green,
        blue = blue
    })
end

function enemy.update(dt)

end

function enemy.draw()
    for i,e in ipairs(enemy) do
        love.graphics.setColor(e.red, e.green, e.blue)
        love.graphics.rectangle("fill", e.x, e.y, e.width, e.height)
        love.graphics.setColor(255, 255, 255)
        love.graphics.print({{255, 255, 255}, e.wordCorrectSoFar,  {e.red, e.green, e.blue}, e.wordRemaining} , e.x, e.y + e.height)
    end
end

function enemy.keypressed(key)
    for i,e in ipairs(enemy) do
        local enemyFirstLetter = e.wordRemaining:sub(0, 1 )
        print("letter pressed was: ",key)
        print("enemy first letter is: ", enemyFirstLetter)
        print("word corrent so far: ", e.wordCorrectSoFar)
        print("word remaining are: ", e.wordRemaining)
        if enemyFirstLetter == key then
            print("Letter matched!")
            local restOfEnemyWord = e.wordRemaining:sub(2, string.len(e.wordRemaining))
            print(restOfEnemyWord)
            -- e.word = restOfEnemyWord
            e.wordCorrectSoFar = e.wordCorrectSoFar .. key
            e.wordRemaining = restOfEnemyWord
        else 
            e.wordCorrectSoFar = " "
            e.wordRemaining = e.word
        end

        if e.wordRemaining == "" then
            table.remove(enemy, i)
        end
    end
end
