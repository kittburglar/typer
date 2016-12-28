bullet = {}

function bullet.create(x, y, width, height, red, green, blue, speed, enemy)
    table.insert(bullet, {
        x = x,
        y = y,
        width = width,
        height = height,
        red = red,
        green = green,
        blue = blue,
        speed = speed,
        startTime = love.timer.getTime(),
        enemy = enemy,
        bulletTime = .2
    })
end

function bullet.update(dt)
    for i,b in ipairs(bullet) do
        if love.timer.getTime() - b.startTime >= b.bulletTime then
            table.remove(bullet, i)
        end
        -- Rotate us to face the player
        b.rotation = math.atan2(b.enemy.y - b.y, b.enemy.x - b.x);
        -- Move towards the player
        b.x = b.x + math.cos(b.rotation) * b.speed;
        b.y = b.y + math.sin(b.rotation) * b.speed;
    end
end

function bullet.draw()
    for i,b in ipairs(bullet) do
        love.graphics.setColor(b.red, b.green, b.blue)
        love.graphics.rectangle("fill", b.x, b.y, b.width, b.height)
        love.graphics.setColor(234,234,234)
    end
end