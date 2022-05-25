function drawWavePlatform(mode, x, y, width, height, posX, posY)
    --motivation: can't rotate directly, but can manip coordinate system
    love.graphics.push() -- what is this, assumption, pushing on to mod-stack
    love.graphics.translate(x + posX, y + posY) -- moves drawing start point to x,y
    love.graphics.rectangle(mode, 0, 0, width, height)
    love.graphics.pop()
end


local increase = true
local posX = 0
local posY = 0

function waveCalc(posX, posY, dt)
    if posX > 300
    then
        increase = false 
    elseif posX < -300
    then
        increase = true
    end
    if increase
    then
        posX = posX + dt * 100
    else
        posX = posX - dt * 100
    end
    -- outside factor scales amplitude
    -- inner factor scales frequency
    posY = math.sin(0.0125 * posX) * 100
    return posX, posY
end

-- as per docs dt is type number, the time since last update in seconds
function love.update(dt)
    posX, posY = waveCalc(posX, posY, dt)
end

function love.draw()
    drawWavePlatform("fill", 400, 400, 60, 10, posX, posY)
end
