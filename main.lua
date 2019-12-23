
function love.load()
    if arg[#arg] == '-debug' then require ("mobdebug").start() end
    require "vector"
    Object = require "classic"  
    require "shapes/shape"
    require "shapes/rectangle"
    require "shapes/circle"
    require("gameObjects/ball")
    require("gameObjects/paddle")
    require("gameObjects/brick")
    require("gameObjects/wall")
    require("gameObjects/popcorn")
    math.randomseed(os.time())
    popcorn = Popcorn()
    love.mouse.setVisible(false)
end

function love.update(dt)  
  popcorn:runGame(dt)       
end

function love.draw()
   popcorn:draw()
end
  function love.keypressed(key, scancode, isrepeat)
   if key == "return" then        
      popcorn:unpause()
   end
  end
