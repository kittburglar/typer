require "player"
require "explosion"
require "words"

enemy = {}
enemyColors = {{200, 40, 41},{245, 135, 31},{234, 183, 0},{113, 140, 0},{62, 153, 159},{137, 89, 168}}

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
        blue = blue,
        speed = .5,
        deathAnimationTimer = 0,
        deathStartTime = 0
    })
end

function enemy.update(dt)
    enemy.checkCollision()

    for i,e in ipairs(enemy) do
        if e.x < player.x then
            e.x = e.x + e.speed
        end
        if e.y < player.y then
            e.y = e.y + e.speed
        end
        if e.x > player.x then
            e.x = e.x - e.speed
        end
        if e.y > player.y then
            e.y = e.y - e.speed
        end
    end
end

function enemy.draw()
    for i,e in ipairs(enemy) do
        love.graphics.setColor(e.red, e.green, e.blue)
        love.graphics.rectangle("fill", e.x, e.y, e.width, e.height)
        love.graphics.setColor(255, 255, 255)
        love.graphics.setNewFont(15)
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
            print("Leftover word is " .. restOfEnemyWord)
            e.wordCorrectSoFar = e.wordCorrectSoFar .. key
            e.wordRemaining = restOfEnemyWord
        else 
            e.wordCorrectSoFar = " "
            e.wordRemaining = e.word
        end

        if e.wordRemaining == "" then
            explosion.spawn(e.x + e.width/2, e.y + e.height/2, e.red, e.green, e.blue)
            table.remove(enemy, i)
        end
    end
end

function enemy.checkCollision()
    for i,e in ipairs(enemy) do
        if (helper.collisionDetection(e, player)) then
            print("Enemy: Collision detected")
            table.remove(enemy, i)
        end
    end
end

function enemy.randomCreate()
    
    local randomSpawn = math.random(0, 3)
    print("Enemy colour is:", enemyColors[1])
    local randomColor = enemyColors[math.random(1, 6)]
    if randomSpawn == 0 then
        enemy.create(0, math.random(0, love.graphics.getWidth()), 20, 20, randomColor[1], randomColor[2], randomColor[3], words.getRandomWord()) 
    elseif randomSpawn == 1 then
        enemy.create(math.random(0, love.graphics.getWidth()), 0, 20, 20, randomColor[1], randomColor[2], randomColor[3], words.getRandomWord())
    elseif randomSpawn == 2 then
        enemy.create(love.graphics.getWidth(), math.random(0, love.graphics.getHeight()), 20, 20, randomColor[1], randomColor[2], randomColor[3], words.getRandomWord())
    elseif randomSpawn == 3 then
        enemy.create(math.random(0, love.graphics.getWidth()), love.graphics.getHeight(), 20, 20, randomColor[1], randomColor[2], randomColor[3], words.getRandomWord())
    end
end
