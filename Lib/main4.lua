--
--//find shader for löve.
--// Source: https://stackoverflow.com/a/34660473 .
local shader = io.open("C:/Users/Naeland/Documents/GitHub/Blove/blove2/Lib/shader.glsl"):read("*a")
function love.load()
    GLSLShader = love.graphics.newShader(shader)
end

function love.draw()

    love.graphics.setShader(GLSLShader)
    love.graphics.rectangle('fill', 0,0,800,600)
    love.graphics.setShader()
end
