-- main.lua
-- A simple Love2D program for Python programmers learning Lua + Love2D

-- 🐍 Python vs Lua note:
-- Lua uses "function ... end" instead of indentation to define blocks
-- Variables don't need "local" in Python, but in Lua we often use "local"
-- Tables (Lua's version of lists/dictionaries) are very powerful and flexible

-- 🧠 Define a game state table to keep track of position, speed, etc.
local player = {
    x = 100,           -- x-position
    y = 100,           -- y-position
    radius = 30,       -- player size
    speed = 200        -- pixels per second
}

-- 💖 love.load() runs once at the start
function love.load()
    -- Set the window title
    love.window.setTitle("My First Love2D Game!")
    
    -- Set the window size
    love.window.setMode(800, 600)
end

-- 🔁 love.update(dt) runs every frame; dt is the time since the last frame (in seconds)
function love.update(dt)
    -- Move player using arrow keys
    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed * dt
    elseif love.keyboard.isDown("left") then
        player.x = player.x - player.speed * dt
    end

    if love.keyboard.isDown("down") then
        player.y = player.y + player.speed * dt
    elseif love.keyboard.isDown("up") then
        player.y = player.y - player.speed * dt
    end
end

-- 🖼️ love.draw() is where you draw things on screen every frame
function love.draw()
    -- Set a color (R,G,B,A), values from 0 to 1
    love.graphics.setColor(1, 0, 0)  -- red

    -- Draw a filled circle at player position
    love.graphics.circle("fill", player.x, player.y, player.radius)

    -- Set color for text
    love.graphics.setColor(1, 1, 1)  -- white

    -- Draw some text
    love.graphics.print("Use arrow keys to move the red circle!", 10, 10)
end

-- 🎹 Optional: handle keypresses (not held)
function love.keypressed(key)
    if key == "escape" then
        love.event.quit()  -- Press ESC to quit
    end
end
