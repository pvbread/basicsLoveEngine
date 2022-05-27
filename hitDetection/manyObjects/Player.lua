Player = Class{}

function Player:init(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.hitbox = {{x, y},{x + width, y}, {x, y + height}, {x + width, y + height}}
    --self.hitbox = {{self.x + posX, self.y + posY},{self.x + width + posX, self.y + posY}, {self.x + posX, self.y + height + posY}, {self.x + width + posX, self.y + height + posY}}
end

function drawPlayer(mode, x, y, width, height, posX, posY)
    love.graphics.push() -- what is this, assumption, pushing on to mod-stack
    love.graphics.translate(x + posX, y + posY) -- moves drawing start point to x,y
    love.graphics.rectangle(mode, 0, 0, width, height)
    love.graphics.pop()
end

local posX = 0
local posY = 0


function love.update(dt)
    if love.keyboard.isDown("left")
    then
        posX = posX - 10
    end
    if love.keyboard.isDown("right")
    then
        posX = posX + 10
    end
    if love.keyboard.isDown("up") then
        posY = posY - 10
    end
    if love.keyboard.isDown("down")
    then
        posY = posY + 10  
    end

end

function Player:render()
    drawPlayer('fill', self.x, self.y, self.width, self.height, posX, posY)
end
