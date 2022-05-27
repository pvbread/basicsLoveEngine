function drawRectangle(mode, x, y, width, height)
    --motivation: can't rotate directly, but can manip coordinate system
    love.graphics.push() -- what is this, assumption, pushing on to mod-stack
    love.graphics.translate(x, y) -- moves drawing start point to x,y
    love.graphics.rectangle(mode, 0, 0, width, height)
    love.graphics.pop()
end

function drawMovingPlatform(mode, x, y, width, height, posX, posY)
    love.graphics.push() -- what is this, assumption, pushing on to mod-stack
    love.graphics.translate(x + posX, y + posY) -- moves drawing start point to x,y
    love.graphics.rectangle(mode, 0, 0, width, height)
    love.graphics.pop()
end

function writeText(x, y, input)
    love.graphics.push() -- what is this, assumption, pushing on to mod-stack
    love.graphics.translate(x, y) -- moves drawing start point to x,y
    font = love.graphics.getFont()
    text = love.graphics.newText(font, input)
    love.graphics.draw(text, 25, 25, 0, 2, 2)
    love.graphics.pop()
end

local posX = 0
local posY = 0
local width, height = love.graphics.getDimensions()
-- platform dimensions
local pWidth = 60
local pHeight = 10
local hitbox = {{posX, posY},{posX + pWidth, posY}, {posX, posY + pHeight}, {posX + pWidth, posY + pHeight}}
-- as per docs dt is type number, the time since last update in seconds
local boxX = width/2-30
local boxY = height/2-30
local boxWidth = 60
local boxHeight = 60
local objectBox = {{boxX, boxY},{boxX + boxWidth, boxY}, {boxX, boxY + boxHeight}, {boxX + boxWidth, boxY + boxHeight}}
local isHit = "false"

--testing a hypothetical x, y
function collide(objectBox, leftX, rightX, topY, bottomY)
    --this needs to be rethought, it's close
    if (((leftX > objectBox[1][1] and 
        leftX < objectBox[2][1]) or
        (rightX > objectBox[1][1] and 
        rightX < objectBox[2][1])) and
        ((topY > objectBox[1][1] and 
        topY < objectBox[2][1]) or
        (bottomY > objectBox[1][1] and 
        bottomY < objectBox[2][1])))
    then
        return true
    end
    return false
end

function love.update(dt)
    hitbox = {{posX, posY},{posX + pWidth, posY}, {posX, posY + pHeight}, {posX + pWidth, posY + pHeight}}
    
    if love.keyboard.isDown("left")
    then
        --TODO, check all 4 hitboxes
        if not collide(objectBox, hitbox[1][1]-10, hitbox[2][1]-10, hitbox[1][2], hitbox[2][2])
        then
            posX = posX-10
        end
    end

    if love.keyboard.isDown("right")
    then
        if not collide(objectBox, hitbox[1][1]+10, hitbox[2][1]+10, hitbox[1][2], hitbox[2][2])
        then
            posX = posX + 10
        end
        --posX = posX + 10
    end
    if love.keyboard.isDown("up") then
        if not collide(objectBox, hitbox[1][1], hitbox[2][1], hitbox[1][2]-10, hitbox[2][2]-10)
        then
           posY = posY - 10
        end
        --posY = posY - 10
    end
    if love.keyboard.isDown("down")
    then
        if not collide(objectBox, hitbox[1][1], hitbox[2][1], hitbox[1][2]+10, hitbox[2][2]+10)
        then
            posY = posY + 10
        end
        --posY = posY + 10
    end


end

function love.draw()
    
    drawRectangle("line", boxX, boxY, boxWidth, boxHeight)
    drawMovingPlatform("fill", 0, 0, pWidth, pHeight, posX, posY)
    coords = "UL: (" .. hitbox[1][1] .. ", " .. hitbox[1][2] .. ") " .. "UR: (" .. hitbox[2][1] .. ", " .. hitbox[2][2] .. ")" .. "\n" .. "BL: (" .. hitbox[3][1] .. ", " .. hitbox[3][2] .. ") LR: (" .. hitbox[4][1] .. ", " .. hitbox[4][2] .. ")"
    boxCoords = "UL: (" .. objectBox[1][1] .. ", " .. objectBox[1][2] .. ") " .. "UR: (" .. objectBox[2][1] .. ", " .. objectBox[2][2] .. ")" .. "\n" .. "BL: (" .. objectBox[3][1] .. ", " .. objectBox[3][2] .. ") LR: (" .. objectBox[4][1] .. ", " .. objectBox[4][2] .. ")"
    wh = "W: " .. width .. "H: " .. height
    hit = "collide? " .. isHit
    writeText(200, 100, wh)
    writeText(200, 150, coords)
    writeText(200, 500, boxCoords)
    writeText(200, 450, hit)
end
