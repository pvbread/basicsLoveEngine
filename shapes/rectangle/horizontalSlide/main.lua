function drawSlidingPlatform(mode, x, y, width, height, slide)
    --motivation: can't rotate directly, but can manip coordinate system
    love.graphics.push() -- what is this, assumption, pushing on to mod-stack
    love.graphics.translate(x + slide, y) -- moves drawing start point to x,y
    love.graphics.rectangle(mode, 0, 0, width, height)
    love.graphics.pop()
end


local slide = 0
local increase = true

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
    slide = horizontalSlideCalc(slide, dt)
end

function love.draw()
    drawSlidingPlatform("fill", 400, 400, 60, 10, slide)
end
