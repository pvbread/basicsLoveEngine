local rate      = 44100 -- samples per second
local length    = 1/10  -- how long it plays
local tone      = 220.0 -- Hz
local p         = math.floor(rate/tone) -- 100 (wave length in samples)
local soundData = love.sound.newSoundData(math.floor(length*rate), rate, 16, 1)
for i=0, soundData:getSampleCount() - 1 do
--	soundData:setSample(i, math.sin(2*math.pi*i/p)) -- sine wave.
	soundData:setSample(i, i%p<p/2 and 1 or -1)     -- square wave; the first half of the wave is 1, the second half is -1.
end
local source = love.audio.newSource(soundData)
local function beep() source:play() end

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

-- as per docs dt is type number, the time since last update in seconds
function love.update(dt)
    if love.keyboard.isDown("left")
    then
        if not ((posY > height/2-40 and posY < height/2+30) and posX - 10 == width/2+20)
        then
            posX = posX - 10
        end
        
    end
    if love.keyboard.isDown("right")
    then
        if not ((posY > height/2-40 and posY < height/2+30) and posX + 10 == width/2-80)
        then
            posX = posX + 10
        end
    end
    if love.keyboard.isDown("up") then
        if not ((posX > width/2-90 and posX < width/2+30) and posY - 10 == height/2+20)
        then
           posY = posY - 10
        end
    end
    if love.keyboard.isDown("down")
    then
        if not ((posX > width/2-90 and posX < width/2+30) and posY + 10 == height/2-30)
        then
            posY = posY + 10
        end
    end
    if ((posY > height/2-40 and posY < height/2+30) and posX - 10 == width/2+20) then
        beep()
    elseif ((posY > height/2-40 and posY < height/2+30) and posX + 10 == width/2-80) then
        beep()
    elseif ((posX > width/2-90 and posX < width/2+30) and posY - 10 == height/2+20) then
        beep()
    elseif ((posX > width/2-90 and posX < width/2+30) and posY + 10 == height/2-30) then
        beep()
    end

end

function love.draw()
    
    drawRectangle("line", width/2-30, height/2-30, 60, 60)
    drawMovingPlatform("fill", 0, 0, 60, 10, posX, posY)
    coords = "X: " .. posX .. " Y: " .. posY
    wh = "W: " .. width .. "H: " .. height
    writeText(200, 100, wh)
    writeText(200, 200, coords)
end
