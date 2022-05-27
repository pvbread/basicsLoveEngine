Class = require 'class'

require 'Player'

function love.load()
    background = love.graphics.newImage("canvas.png")
    image = love.graphics.newImage("pig.png")
    player = Player(image, 1, 1, 20, 20)
end

function love.draw()
    love.graphics.draw(background)  
    player:render()
end

