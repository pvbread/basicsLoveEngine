Class = require 'class'

require 'Player'

function love.load()
    image = love.graphics.newImage("char.png")
    player = Player(image, 1, 1, 20, 20)
end


function love.draw() 
    player:render()
end
