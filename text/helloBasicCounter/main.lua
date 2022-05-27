function writeText(x, y, input)
    love.graphics.push() -- what is this, assumption, pushing on to mod-stack
    love.graphics.translate(x, y) -- moves drawing start point to x,y
    font = love.graphics.getFont()
    text = love.graphics.newText(font, input)
    love.graphics.draw(text, 25, 25, 0, 2, 2)
    love.graphics.pop()
end

local num = 0
local clock = 0

-- as per docs dt is type number, the time since last update in seconds
function love.update(dt)
    num = math.floor(clock + dt)
    clock = clock + dt
end

function love.draw()
    writeText(400, 400, "Hello, Key Counter")
    writeText(200, 200, num)
    
end
