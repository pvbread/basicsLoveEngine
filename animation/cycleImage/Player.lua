Player = Class{}

function Player:init(char, x, y, width, height)
    self.char = char
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.hitbox = {{x, y},{x + width, y}, {x, y + height}, {x + width, y + height}}
    
end

local posX = 0
local posY = 0
local charIndex = 1

function drawPlayer(char, x, y, width, height, posX, posY)
    love.graphics.push() -- what is this, assumption, pushing on to mod-stack
    love.graphics.translate(x + posX, y + posY) -- moves drawing start point to x,y   
    love.graphics.draw(char[charIndex])
    love.graphics.pop()
end




function love.update(dt)
    if love.keyboard.isDown("left")
    then
        posX = posX - 2
    end
    if love.keyboard.isDown("right")
    then
        posX = posX + 1
        if math.fmod(posX, 5) == 0
        then
            charIndex = math.fmod(charIndex + 1, 5) + 1
        end
    end
    if love.keyboard.isDown("up") then
        posY = posY - 2
    end
    if love.keyboard.isDown("down")
    then
        posY = posY + 2 
    end

end

function Player:render()
    drawPlayer(self.char, self.x, self.y, self.width, self.height, posX, posY)
end
