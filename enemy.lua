require "player"
require "explosion"
require "words"
require "points"
require "texts"

enemy = {}
enemyColors = {{213,78,83},{231,140,69},{231,197,71},{185,202,74},{112,192,177},{122,166,218}, {195,151,216}}

function enemy.load()
    for i,e in ipairs(enemy) do
        enemy[i] = nil
    end
    enemy.spawnTimer = love.timer.getTime()
end

function enemy.create(x, y, width, height, red, green, blue, word)
    table.insert(enemy, {
        x = x,
        y = y,
        word = word,
        width = (string.len(word) * 5) * (love.graphics.getWidth() / 600),
        height = (string.len(word) * 5) * (love.graphics.getWidth() / 600),
        wordCorrectSoFar = " ",
        wordRemaining = word,
        red = red,
        green = green,
        blue = blue,
        speed = 1 + ((points.currentPoints)/100) * .05,
        deathAnimationTimer = 0,
        deathStartTime = 0,
        points = enemy.getPoints(word)
    })
end

function enemy.update(dt)
    for i,e in ipairs(enemy) do
        -- Rotate us to face the player
        e.rotation = math.atan2(player.y - e.y, player.x - e.x);
        -- Move towards the player
        e.x = e.x + math.cos(e.rotation) * e.speed;
        e.y = e.y + math.sin(e.rotation) * e.speed;
    end
end

function enemy.draw()
    love.graphics.setNewFont(20)
    love.graphics.setNewFont("8-bit-wonder.ttf", 20)
    for i,e in ipairs(enemy) do
        if e.word == "heal" then
            love.graphics.setColor(health.red, health.green, health.blue)
            love.graphics.rectangle("fill", e.x, e.y, e.width, e.height)
            love.graphics.setColor(234,234,234)
            love.graphics.setLineWidth(4)
            love.graphics.rectangle("line", e.x, e.y, e.width, e.height)
            love.graphics.print({{234,234,234}, string.upper(e.wordCorrectSoFar),  {health.red, health.green, health.blue}, string.upper(e.wordRemaining)} , e.x - 10 - (string.len(e.word)*20)/2 + e.width/2, e.y + e.height + 4)
        elseif e.word == "bomb" then
            love.graphics.setColor(bomb.red, bomb.green, bomb.blue)
            love.graphics.rectangle("fill", e.x, e.y, e.width, e.height)
            love.graphics.setColor(234,234,234)
            love.graphics.setLineWidth(4)
            -- love.graphics.setColor(bomb.red, bomb.green, bomb.blue)
            love.graphics.rectangle("line", e.x, e.y, e.width, e.height)
            love.graphics.print({{234,234,234}, string.upper(e.wordCorrectSoFar),  {bomb.red, bomb.green, bomb.blue}, string.upper(e.wordRemaining)} , e.x - 10 - (string.len(e.word)*20)/2 + e.width/2, e.y + e.height + 4)
        else
            love.graphics.setColor(e.red, e.green, e.blue)
            love.graphics.rectangle("fill", e.x, e.y, e.width, e.height)
            love.graphics.setColor(234,234,234)
            love.graphics.print({{234,234,234}, string.upper(e.wordCorrectSoFar),  {e.red, e.green, e.blue}, string.upper(e.wordRemaining)} , e.x - 10 - (string.len(e.word)*20)/2 + e.width/2, e.y + e.height + 4)
        end
        
        
        
    end
end

function enemy.resetAll()
    for i,e in ipairs(enemy) do
        e.wordCorrectSoFar = " "
        e.wordRemaining = e.word
    end
end

function enemy.keypressed(key)
    for i,e in ipairs(enemy) do
        local enemyFirstLetter = e.wordRemaining:sub(0, 1 )
        if enemyFirstLetter == key then
            local restOfEnemyWord = e.wordRemaining:sub(2, string.len(e.wordRemaining))
            e.wordCorrectSoFar = e.wordCorrectSoFar .. key
            e.wordRemaining = restOfEnemyWord

            --Hit Animation
            explosion.spawn(e.x + e.width/2, e.y + e.height/2, 3, 3, e.red, e.green, e.blue, 2, 3, 10, 2)

            e.rotation = math.atan2(player.y - e.y, player.x - e.x);
            -- Move towards the player
            e.x = e.x - 20*math.cos(e.rotation) * e.speed;
            e.y = e.y - 20*math.sin(e.rotation) * e.speed;
        else --Mistyped enemy word
        end

        if e.wordRemaining == "" then
            explosion.spawn(e.x + e.width/2, e.y + e.height/2, 5, 5, e.red, e.green, e.blue, 2.00, 3.00, 100, 2)
            explosion.spawn(e.x + e.width/2, e.y + e.height/2, 7, 7, e.red, e.green, e.blue, 0, 1, 10, 2)

            texts.spawn(e.x + e.width, e.y + e.height, e.red, e.green, e.blue, tostring(e.points * points.multiplier))
            points.multKillCount = points.multKillCount + 1
            points.changed(e.points)
            if points.multKillCount > points.multiplierKillNeeded then
                points.setMultiplier(points.multiplier + 1)
                points.multKillCount = 0
                texts.spawn(e.x + e.width, e.y, e.red, e.green, e.blue, string.format("multiplier x%s", points.multiplier))
            end

            if e.word == "heal" then
                health.change(health.lifepoints + 1)
                texts.spawn(love.graphics.getWidth()/2, e.y - 20, health.red, health.green, health.blue, "health up")
            elseif e.word == "bomb" then
                bomb.change(bomb.bombpoints + 1)
                texts.spawn(love.graphics.getWidth()/2, e.y - 20, bomb.red, bomb.green, bomb.blue, "bomb up")
            end
            table.remove(enemy, i)
        end
    end
end

function enemy.remove(i)
    table.remove(enemy, i)
end

function enemy.randomCreate()
    local spawnType = math.random(0, 10)
    local directionSpawn = math.random(0, 3)
    local randomColor = enemyColors[math.random(1, 7)]
    if directionSpawn == 0 then
        if spawnType == 0 then
            enemy.create(-50, math.random(0, love.graphics.getWidth()), 20, 20, health.red, health.green, health.blue, "heal") 
        elseif spawnType == 1 then
            enemy.create(-50, math.random(0, love.graphics.getWidth()), 20, 20, bomb.red, bomb.green, bomb.blue, "bomb") 
        else
            enemy.create(-50, math.random(0, love.graphics.getWidth()), 20, 20, randomColor[1], randomColor[2], randomColor[3], words.getRandomWord()) 
        end
    elseif directionSpawn == 1 then
        if spawnType == 0 then
            enemy.create(math.random(0, love.graphics.getWidth()), -50, 20, 20, health.red, health.green, health.blue, "heal")
        elseif spawnType == 1 then
            enemy.create(math.random(0, love.graphics.getWidth()), -50, 20, 20, bomb.red, bomb.green, bomb.blue, "bomb")
        else
            enemy.create(math.random(0, love.graphics.getWidth()), -50, 20, 20, randomColor[1], randomColor[2], randomColor[3], words.getRandomWord())
        end
    elseif directionSpawn == 2 then
        if spawnType == 0 then
            enemy.create(love.graphics.getWidth(), math.random(0, love.graphics.getHeight()), 20, 20, health.red, health.green, health.blue, "heal")
        elseif spawnType == 1 then
            enemy.create(love.graphics.getWidth(), math.random(0, love.graphics.getHeight()), 20, 20, bomb.red, bomb.green, bomb.blue, "bomb")
        else
            enemy.create(love.graphics.getWidth(), math.random(0, love.graphics.getHeight()), 20, 20, randomColor[1], randomColor[2], randomColor[3], words.getRandomWord())
        end
    elseif directionSpawn == 3 then
        if spawnType == 0 then
            enemy.create(math.random(0, love.graphics.getWidth()), love.graphics.getHeight(), 20, 20, health.red, health.green, health.blue, "heal")
        elseif spawnType == 1 then
            enemy.create(math.random(0, love.graphics.getWidth()), love.graphics.getHeight(), 20, 20, bomb.red, bomb.green, bomb.blue, "bomb")
        else
            enemy.create(math.random(0, love.graphics.getWidth()), love.graphics.getHeight(), 20, 20, randomColor[1], randomColor[2], randomColor[3], words.getRandomWord())
        end
    end
end

function enemy.spawnCheck()
    if love.timer.getTime() - enemy.spawnTimer >= 3 then
            enemy.spawnTimer = love.timer.getTime()
           
            for i = 1, math.random(1, 1 + math.min(((points.currentPoints)/50)*1, 2)) do
                enemy.randomCreate()
            end
        end
end

-- F ×2, H ×2, V ×2, W ×2, Y ×2

function enemy.getPoints(word)
    local points = 0
    for i = 1, string.len(word) do
        local letter = string.sub(word, i, i)
        if (letter == "e" or letter == "a" or letter == "i" or letter == "o" or letter == "n" or letter == "r" or letter == "t" or letter == "l" or letter == "s" or letter == "u") then
            points = points + 1
        elseif (letter == "d" or letter == "g") then
            points = points + 2
        elseif (letter == "b" or letter == "c" or letter == "m" or letter == "p") then
            points = points + 3
        elseif (letter == "f" or letter == "h" or letter == "v" or letter == "w" or letter == "y") then
            points = points + 4 
        elseif (letter == "k") then
            points = points + 5 
        elseif (letter == "j" or letter == "x") then
            points = points + 8 
        elseif (letter == "q" or letter == "z") then
            points = points + 10 
        end
    end
    -- print ("Points for ", word, " are ", points)
    return points
end
