function drawMovingPlatform(mode, x, y, width, height, posX, posY)
    love.graphics.push() -- what is this, assumption, pushing on to mod-stack
    love.graphics.translate(x + posX, y + posY) -- moves drawing start point to x,y
    love.graphics.rectangle(mode, 0, 0, width, height)
    love.graphics.pop()
end

local posX = 0
local posY = 0

function love.keypressed(key, scancode, isrepeat)
    --discrete input
    if key == "a" then
       posX = posX - 10
    end
    if key == "d" then
        posX = posX + 10
     end
 end

-- as per docs dt is type number, the time since last update in seconds
function love.update(dt)
    if love.keyboard.isDown("left")
    then
        posX = posX - 10
    end
    if love.keyboard.isDown("right")
    then
        posX = posX + 10
    end
    if love.keyboard.isDown("up")
    then
        posY = posY - 10
    end
    if love.keyboard.isDown("down")
    then
        posY = posY + 10
    end
end

function love.load()
	love.keyboard.setKeyRepeat(true)
end

function love.draw()
    drawMovingPlatform("fill", 400, 400, 60, 10, posX, posY)
end