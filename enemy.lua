enemy = {}

function enemy.create(x, y, width, height)
    table.insert(enemy, {
        x = x,
        y = y,
        width = width,
        height = height,
        word = "HELLO"
    })
end

function enemy.update(dt)

end

function enemy.draw()
    for i,e in ipairs(enemy) do
        print("hello", e.x, e.y, e.width, e.height)
        love.graphics.setColor(255, 255, 255)
        love.graphics.rectangle("fill", e.x, e.y, e.width, e.height)
        love.graphics.print(e.word, e.x, e.y + e.height)
    end
end
