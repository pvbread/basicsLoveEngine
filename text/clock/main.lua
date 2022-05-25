function writeText(x, y, input)
    --motivation: can't rotate directly, but can manip coordinate system
    love.graphics.push() -- what is this, assumption, pushing on to mod-stack
    love.graphics.translate(x, y) -- moves drawing start point to x,y
    font = love.graphics.getFont()
    currText = love.graphics.newText(font, input)
    love.graphics.draw(currText, 25, 25, 0, 2, 2)
    love.graphics.pop()
end

local num = 0
local clock = 0
local text = "0:00"
local decr = "5:00"
local countDown = 300
local startTime = 300

function getClockTime(time)
    minutes = math.floor(time / 60)
    seconds = time - (minutes * 60)
    return minutes, seconds
end

function love.update(dt)
    elapsed = math.floor(clock + dt)
    clock = clock + dt
    minutes, seconds = getClockTime(elapsed)
    if seconds < 10
    then
        text = minutes .. ":0" .. seconds
    else
        text = minutes .. ":" .. seconds
    end
    
    countDown = startTime - math.floor(clock + dt)
    minutes, seconds = getClockTime(countDown)
    if seconds < 10
    then
        decr = minutes .. ":0" .. seconds
    else
        decr = minutes .. ":" .. seconds
    end
end

function love.draw()
    writeText(200, 200, text)
    writeText(200, 100, decr)
end