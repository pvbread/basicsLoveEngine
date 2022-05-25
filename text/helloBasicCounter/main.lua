function writeText(x, y, input)
    --motivation: can't rotate directly, but can manip coordinate system
    love.graphics.push() -- what is this, assumption, pushing on to mod-stack
    love.graphics.translate(x, y) -- moves drawing start point to x,y
    font = love.graphics.getFont()
    text = love.graphics.newText(font, input)
    love.graphics.draw(text, 25, 25, 0, 2, 2)
    love.graphics.pop()
end

local num = 0
local num2 = 0
local clock = 0

-- as per docs dt is type number, the time since last update in seconds
function love.update(dt)
    --num = math.floor(num + dt)
    num = math.floor(clock + dt)
    num2 = math.floor(clock + dt)
    clock = clock + dt
end

function love.draw()
    writeText(400, 400, "Hello, Morld")
    writeText(200, 200, num)
    writeText(200, 100, num2)
    --font = love.graphics.getFont()
    --regular text
    --plainText = love.graphics.newText(font, "Hello world")
    --colored text
    --coloredText = love.graphics.newText(font, {{1, 0, 0}, "Hello ", {0, 0, 1}, " Morld"})
    --love.graphics.draw(coloredText, 50, 50, 0, 5, 5)
end
