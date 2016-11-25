enemy = {}

function enemy.create(x, y, width, height, red, green, blue, word)
    table.insert(enemy, {
        x = x,
        y = y,
        width = width,
        height = height,
        word = word,
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
        love.graphics.print(e.word, e.x, e.y + e.height)
    end
end

function enemy.keypressed(key)
    for i,e in ipairs(enemy) do
        local enemyFirstLetter = e.word:sub(0, 1 )
        print("letter pressed was: ",key)
        print("enemy first letter is: ", enemyFirstLetter)
        if enemyFirstLetter == key then
            print("Letter matched!")
            local restOfEnemyWord = e.word:sub(2, string.len(e.word))
            print(restOfEnemyWord)
            e.word = restOfEnemyWord
        end

        if e.word == "" then
            table.remove(enemy, i)
        end
    end
end
