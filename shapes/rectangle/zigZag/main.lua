function drawZigZagPlatform(mode, x, y, width, height, zig, zag)
    --motivation: can't rotate directly, but can manip coordinate system
    love.graphics.push() -- what is this, assumption, pushing on to mod-stack
    love.graphics.translate(x + zig, y + zag) -- moves drawing start point to x,y
    love.graphics.rectangle(mode, 0, 0, width, height)
    love.graphics.pop()
end


local incrZig = true
local zig = 0
local zag = 0


--try getting it to climb up

function zigZagSlideCalc(posX, posY, dt)
    if posX < 0
    then
        incrZig = true
    elseif posX > 100
    then
        incrZig = false
    end

    if incrZig
    then
        posX = posX + dt * 50
        posY = posY - dt * 50
    else
        posX = posX - dt * 50
        posY = posY + dt * 50
    end

    return posX, posY

end

-- as per docs dt is type number, the time since last update in seconds
function love.update(dt)
    zig, zag = zigZagSlideCalc(zig, zag, dt)
end

function love.draw()
    drawZigZagPlatform("fill", 400, 400, 60, 10, zig, zag)
end
