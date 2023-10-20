--love.window.setFullscreen(true)
math.randomseed(os.time())

--love.graphics.set
local local_path = love.filesystem.getSourceBaseDirectory()
--love.filesystem.setSource(local_path)
print(love.filesystem.getInfo("/home/nael/","file"))
print(love.filesystem.getAppdataDirectory())
print(love.filesystem.getIdentity())
print(love.filesystem.getWorkingDirectory())
print(love.filesystem.getSource())--([[.//Lib/Pixhole's tileset/MasterSimple18.png]]))
print(love.filesystem.getUserDirectory())
print(#love.filesystem.getDirectoryItems("/"))
for k,v in ipairs(love.filesystem.getDirectoryItems("/usr")) do
  print(k,v)
end
print(local_path)
Tiles = require("/Lib/Tiles/init")
a = love.filesystem.newFileData(io.open("/Lib/Pixhole's tileset/MasterSimple18.png","rb"):read("*a"),0)
b = love.graphics.newImage(a)--"/home/nael/DownHereOnTheRed/Lib/Pixhole's tileset/MasterSimple18.png")
function love.draw()
  love.graphics.draw(b,0,0)
end
--/home/nael/DownHereOnTheRed/Lib/Tiles/init.lua
--[=====[]=====]
s = 64
Tiles:setGridSize(s)
Tiles:setTiles({
    --{name = "grass",texture = "grass.jpg"},
    --{name = "test",texture = "test.jpg"},
    --{name = "test2",texture = "test2.jpg"}
    {texture = local_path.."/Lib/Pixhole's tileset/MasterSimple18.png"},
    {texture = local_path.."/Lib/Pixhole's tileset/MasterSimple82.png"},
    {texture = local_path.."/Lib/Pixhole's tileset/MasterSimple130.png"},
    {texture = local_path.."/Lib/Pixhole's tileset/MasterSimple24.png"},
    {texture = local_path.."/Lib/Pixhole's tileset/MasterSimple75.png"},
    nil
    })

Tiles:setGenFunction(function( self, mx, my )
    for i = 1,mx do
      self.grid[i] = {}
      self.decorations[i] = {}
      for k = 1,my do
        --self.grid[i][k] = math.random(1,4)
        --self.grid[i][k] = nil
        self.grid[i][k] = math.floor(love.math.noise(i,k) + 0.2)%2 + 1
        if math.random()>=0.95 and math.floor(love.math.noise(i,k) + 0.2)%2 + 1 == 1 then
          self.decorations[i][k] = 4
        elseif math.random()>=0.95 and math.floor(love.math.noise(i,k) + 0.2)%2 + 1 == 1 then
          self.decorations[i][k] = 5
        end
        --print(love.math.noise(i,k)%3 + 1)
      end
      --print(table.concat(self.grid[i]))
    end
  end)

Tiles:generate(1000,1000)

Tiles:move(500*16,500*16)

function love.update(dt)
  --Tiles:move(50,50)
  local v = dt / ((1/3)/60)
  
  if love.keyboard.isDown("left") then Tiles:move(-10 * v,0) 
  elseif love.keyboard.isDown("right") then Tiles:move(10 * v,0)  end


  if love.keyboard.isDown("down") then Tiles:move(0,10 * v) 
  elseif love.keyboard.isDown("up") then Tiles:move(0,-10 * v)  end

end

function love.draw()
  Tiles:draw()
  love.graphics.print(1.0/love.timer.getDelta())
end
--]=====]
function love.keyreleased(key)if key=="escape"then love.event.quit()end end