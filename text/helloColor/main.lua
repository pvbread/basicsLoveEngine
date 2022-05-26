function writeColorText(x, y, color, input)
    --motivation: can't rotate directly, but can manip coordinate system
    love.graphics.push() -- what is this, assumption, pushing on to mod-stack
    love.graphics.translate(x, y) -- moves drawing start point to x,y
    font = love.graphics.getFont()
    text = love.graphics.newText(font, {color, input})
    love.graphics.draw(text, -20, 0, 0, 6, 6)
    love.graphics.pop()
end

function writeText(x, y, input)
    --motivation: can't rotate directly, but can manip coordinate system
    love.graphics.push() -- what is this, assumption, pushing on to mod-stack
    love.graphics.translate(x, y) -- moves drawing start point to x,y
    font = love.graphics.getFont()
    text = love.graphics.newText(font, input)
    love.graphics.draw(text, -20, 0, 0, 6, 6)
    love.graphics.pop()
end

local num = 0
local clock = 0
local red = 0
local green = 0.50
local blue = 1
--print local debug variables for all components of red to test later

-- as per docs dt is type number, the time since last update in seconds
function love.update(dt)
    elapsed = math.floor(clock + dt)
    clock = clock + dt
    --red = 50*math.sin((0.0125*(clock)))^2--why is red monotonically increasing??
    --red = love.math.colorFromBytes(math.fmod(clock, 255))
    tempRed = math.fmod(clock, 255)
    red, green, blue, _ = love.math.colorFromBytes(tempRed, tempRed, tempRed, 0)
    green = red + 0.75
    if green > 1
    then
        green = green - 1
    blue = red + 0.25
    end
    if red > 1
    then
        red = red - 1
    end
    --green = 50*math.sin(0.0125 * (elapsed + math.pi/2))^2 
    --blue = math.sin(200 * elapsed)
    color = {red, 0.75, 0.25}
end

function love.draw()
    writeColorText(200, 400, {red, green, blue}, "Hello, Morld")
    writeColorText(200, 100, {green, blue, red}, "Morld, Hell?")
    writeText(400, 200, red) 
    writeText(400, 50, green)  
    writeText(400, 250, blue)   
end