function writeText(x, y, input)
    love.graphics.push() -- what is this, assumption, pushing on to mod-stack
    love.graphics.translate(x, y) -- moves drawing start point to x,y
    font = love.graphics.getFont()
    text = love.graphics.newText(font, input)
    love.graphics.draw(text, 25, 25, 0, 2, 2)
    love.graphics.pop()
end

local num = 0

function love.keypressed(key, scancode, isrepeat)
    --discrete input
    if key == "w" then
       num = num + 1
    end
 end

-- as per docs dt is type number, the time since last update in seconds
function love.update(dt)
    --continuous increase (sensitive)
    if love.keyboard.isDown("up")
    then
        num = num + 1
    end
    if love.keyboard.isDown("down")
    then
        num = num - 1
    end
end

--necessary to make the discrete changes work with key-holding
function love.load()
	love.keyboard.setKeyRepeat(true)
end

function love.draw()
    writeText(400, 400, "Hello, Key Counter")
    writeText(200, 200, num)  
end
