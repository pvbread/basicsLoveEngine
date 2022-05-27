Class = require 'class'

require 'Rectangle'
require 'Player'

function love.load()
    box1 = Rectangle(50, 50, 60, 60)
    box2 = Rectangle(400,50, 100, 100)
    box3 = Rectangle(100, 350, 20, 40)
    box4 = Rectangle(450, 350, 150, 150)
    player = Player(1,1, 20, 20)
end

function love.draw()
    box1:render()
    box2:render()
    box3:render()
    box4:render()
    player:render()
end