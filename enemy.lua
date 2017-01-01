require "player"
require "explosion"
require "words"
require "points"
require "texts"

enemy = {}
enemyColors = {{213,78,83},{231,140,69},{231,197,71},{185,202,74},{112,192,177},{122,166,218}, {195,151,216}}
local lastColor = {}

function enemy.load()
    for i,e in ipairs(enemy) do
        enemy[i] = nil
    end
    enemy.spawnTimer = love.timer.getTime()
end

function enemy.create(x, y, width, height, red, green, blue, layers, numberOfLayers)
    table.insert(enemy, {
        x = x,
        y = y,
        layers = layers,
        width = (numberOfLayers * 20) * (love.graphics.getWidth() / 600),
        height = (numberOfLayers * 20) * (love.graphics.getWidth() / 600),
        damageRecieved = 0,
        healthpoints = numberOfLayers,
        speed = 0.6 + ((points.currentPoints)/100) * .05,
        deathAnimationTimer = 0,
        deathStartTime = 0,
        points = numberOfLayers
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
    love.graphics.setNewFont("8-bit-wonder.ttf", 20)
    for i,e in ipairs(enemy) do
        if e.word == "heal" then
            love.graphics.setColor(health.red, health.green, health.blue)
            love.graphics.rectangle("fill", e.x, e.y, e.width, e.height)
            love.graphics.setColor(234,234,234)
            love.graphics.rectangle("line", e.x, e.y, e.width, e.height)
            love.graphics.print({{234,234,234}, string.upper(e.damageRecieved),  {health.red, health.green, health.blue}, string.upper(e.healthpoints)} , e.x - 10 - (string.len(e.word)*20)/2 + e.width/2, e.y + e.height + 4)
        elseif e.word == "bomb" then
            love.graphics.setColor(bomb.red, bomb.green, bomb.blue)
            love.graphics.rectangle("fill", e.x, e.y, e.width, e.height)
            love.graphics.setColor(234,234,234)
            love.graphics.rectangle("line", e.x, e.y, e.width, e.height)
            love.graphics.print({{234,234,234}, string.upper(e.damageRecieved),  {bomb.red, bomb.green, bomb.blue}, string.upper(e.healthpoints)} , e.x - 10 - (string.len(e.word)*20)/2 + e.width/2, e.y + e.height + 4)
        else
            for i = e.damageRecieved+1, e.healthpoints do
                local enemyColor = enemyColors[e.layers[i]]
                local layerOffset = (e.width/2) / e.healthpoints * (i-1)
                love.graphics.setColor(enemyColor[1], enemyColor[2], enemyColor[3])
                love.graphics.rectangle("fill", e.x + layerOffset, e.y + layerOffset, e.width - layerOffset*2, e.height - layerOffset*2)
            end
            -- love.graphics.setColor(e.red, e.green, e.blue)
            -- love.graphics.rectangle("fill", e.x, e.y, e.width, e.height)
            -- love.graphics.setColor(234,234,234)
            -- love.graphics.print({{234,234,234}, string.upper(e.damageRecieved),  {e.red, e.green, e.blue}, string.upper(e.healthpoints)} , e.x - 10 - (string.len(e.word)*20)/2 + e.width/2, e.y + e.height + 4)
        end
        
        
        
    end
end

function enemy.remove(i)
    table.remove(enemy, i)
end

function enemy.randomCreate()
    local spawnType = math.random(0, 20)
    local directionSpawn = math.random(0, 3)
    local randomIndex = math.random(1, 7)
    local randomColor = enemyColors[randomIndex]
    if lastColor == randomColor then
        print("new color!", randomIndex, (randomIndex)%7 + 1)
        randomColor = enemyColors[(randomIndex)%7 + 1]
    end
    lastColor = randomColor
    

    if directionSpawn == 0 then
        if spawnType == 0 then
            -- enemy.create(x, y, width, height, red, green, blue, layers, numberOfLayers)
            -- enemy.create(-50, math.random(0, love.graphics.getHeight() - 216), 20, 20, health.red, health.green, health.blue, "heal") 
        elseif spawnType == 1 then
            -- enemy.create(-50, math.random(0, love.graphics.getHeight() - 216), 20, 20, bomb.red, bomb.green, bomb.blue, "bomb") 
        else
            enemy.create(-50, math.random(0, love.graphics.getHeight() - 216), 20, 20, randomColor[1], randomColor[2], randomColor[3], {math.random(1, 7), math.random(1, 7), math.random(1, 7)}, 3) 
        end
    elseif directionSpawn == 1 then
        if spawnType == 0 then
            -- enemy.create(math.random(0, love.graphics.getWidth()), -50, 20, 20, health.red, health.green, health.blue, "heal")
        elseif spawnType == 1 then
            -- enemy.create(math.random(0, love.graphics.getWidth()), -50, 20, 20, bomb.red, bomb.green, bomb.blue, "bomb")
        else
            enemy.create(math.random(0, love.graphics.getWidth()), -50, 20, 20, randomColor[1], randomColor[2], randomColor[3], {math.random(1, 7), math.random(1, 7), math.random(1, 7)}, 3)
        end
    elseif directionSpawn == 2 then
        if spawnType == 0 then
            -- enemy.create(love.graphics.getWidth(), math.random(0, love.graphics.getHeight() - 216), 20, 20, health.red, health.green, health.blue, "heal")
        elseif spawnType == 1 then
            -- enemy.create(love.graphics.getWidth(), math.random(0, love.graphics.getHeight() - 216), 20, 20, bomb.red, bomb.green, bomb.blue, "bomb")
        else
            enemy.create(love.graphics.getWidth(), math.random(0, love.graphics.getHeight() - 216), 20, 20, randomColor[1], randomColor[2], randomColor[3], {math.random(1, 7), math.random(1, 7), math.random(1, 7)}, 3)
        end
    elseif directionSpawn == 3 then
        if spawnType == 0 then
            -- enemy.create(math.random(0, love.graphics.getWidth()), love.graphics.getHeight() - 216, 20, 20, health.red, health.green, health.blue, "heal")
        elseif spawnType == 1 then
            -- enemy.create(math.random(0, love.graphics.getWidth()), love.graphics.getHeight() - 216, 20, 20, bomb.red, bomb.green, bomb.blue, "bomb")
        else
            enemy.create(math.random(0, love.graphics.getWidth()), love.graphics.getHeight() - 216, 20, 20, randomColor[1], randomColor[2], randomColor[3], {math.random(1, 7), math.random(1, 7), math.random(1, 7)}, 3)
        end
    end
end

function enemy.spawnCheck()
    if love.timer.getTime() - enemy.spawnTimer >= 5 then
            enemy.spawnTimer = love.timer.getTime()
           
            for i = 1, math.random(1, 1 + math.min(((points.currentPoints)/50)*1, 1)) do
                enemy.randomCreate()
            end
        end
end

function enemy.pressedButton(button)
    -- {1, 2, 3}
    print("Button pressed is: ", button)
    for i,e in ipairs(enemy) do
        print(e.layers[e.damageRecieved+1])
        if e.layers[e.damageRecieved+1] == button then
            local enemyColor = enemyColors[e.layers[e.damageRecieved+1]]
            e.damageRecieved = e.damageRecieved + 1
            explosion.spawn(e.x + e.width/2, e.y + e.height/2, 5, 5, enemyColor[1], enemyColor[2], enemyColor[3], 2.0, 4.0, 100, 2)
            bullet.create(player.x, player.y, 5, 5, enemyColor[1], enemyColor[2], enemyColor[3], 30, e)
            player.rotation = math.atan2(e.y - player.y, e.x - player.x);
            if e.damageRecieved == e.healthpoints then
                points.multKillCount = points.multKillCount + 1
                points.changed(e.points)
                texts.spawn(e.x + e.width, e.y + 20, 255, 255, 255, string.format("%s", e.points),3)
                if points.multKillCount > points.multiplierKillNeeded then
                    points.setMultiplier(points.multiplier + 1)
                    points.multKillCount = 0
                    texts.spawn(e.x + e.width, e.y, 255, 255, 255, string.format("x%s", points.multiplier),3)
                end
                enemy.remove(i)
            end
        end
    end 
end

