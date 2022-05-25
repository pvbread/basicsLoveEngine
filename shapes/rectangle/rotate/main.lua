function drawRotatedRectangle(mode, x, y, width, height, angle)
    --motivation: can't rotate directly, but can manip coordinate system
    love.graphics.push() -- what is this, assumption, pushing on to mod-stack
    love.graphics.translate(x, y) -- moves drawing start point to x,y
    love.graphics.rotate(angle)
    love.graphics.rectangle(mode, 0, 0, width, height)
    love.graphics.pop()
end

local angle = (22/7)/3 -- try pi, pi/2, pi/3
local crossangle = 0

function horizontalSlideCalc(pos, dt)
    if pos > 100
    then
        increase = false 
    elseif pos < 0
    then
        increase = true
    end
    if increase
    then
        pos = pos + dt * 50
    else
        pos = pos - dt * 50
    end
    return pos
    --[[if pos > 100 or pos <= 0
    then
        dir = -1 * dir
    end

    pos = pos + ((dt * 50) * dir)
    return pos]]
end

-- as per docs dt is type number, the time since last update in seconds
function love.update(dt)
    angle = angle + dt * 2 -- last scalar is the rotation speed
    crossangle = crossangle + dt * -2
end

function love.draw()
    drawRotatedRectangle("line", 150, 150, 1, 60, angle)
    drawRotatedRectangle("line", 300, 300, 1, 60, crossangle)
end
