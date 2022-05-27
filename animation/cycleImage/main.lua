Class = require 'class'

require 'Player'

function love.load()
    char1 = love.graphics.newImage("char1.png")
    char2 = love.graphics.newImage("char2.png")
    char3 = love.graphics.newImage("char3.png")
    char4 = love.graphics.newImage("char4.png")
    char5 = love.graphics.newImage("char5.png")
    char = {char1, char2, char3, char4, char5}
    player = Player(char, 1, 1, 20, 20)
end


function love.draw() 
    player:render()
end
