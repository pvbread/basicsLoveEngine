function writeText(x, y, input)
    love.graphics.push() -- what is this, assumption, pushing on to mod-stack
    love.graphics.translate(x, y) -- moves drawing start point to x,y
    font = love.graphics.getFont()
    text = love.graphics.newText(font, input)
    love.graphics.draw(text, 25, 25, 0, 2, 2)
    love.graphics.pop()
end
local rate      = 44100 -- samples per second
local length    = 1/32  -- how long it plays
local tone      = 440.0 -- Hz
local p         = math.floor(rate/tone) -- 100 (wave length in samples)
local soundData = love.sound.newSoundData(math.floor(length*rate), rate, 16, 1)
for i=0, soundData:getSampleCount() - 1 do
--	soundData:setSample(i, math.sin(2*math.pi*i/p)) -- sine wave.
	soundData:setSample(i, i%p<p/2 and 1 or -1)     -- square wave; the first half of the wave is 1, the second half is -1.
end
local source = love.audio.newSource(soundData)
local function beep() source:play() end

function love.keypressed(key, scancode, isrepeat)
    --discrete input
    if key == "w" then
       beep()
    end
 end

-- as per docs dt is type number, the time since last update in seconds
function love.update(dt)
    --continuous increase (sensitive)
    if love.keyboard.isDown("up")
    then
        beep()
    end
    
end

--necessary to make the discrete changes work with key-holding
function love.load()
	love.keyboard.setKeyRepeat(true)
end

function love.draw()
    writeText(400, 400, "Hello, Key Sound")
end
