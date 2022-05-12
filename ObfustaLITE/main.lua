Logo = love.graphics.newImage("Assets/Logo.png")
Background = love.graphics.newImage("Assets/Background.png")
ImageData = love.image.newImageData("Assets/Logo.png")
Config = require("conf")
love.window.setIcon(ImageData)
love.window.setTitle("Obfusta LITE 1.1")
function love.load()
Music = love.audio.newSource("Assets/BackgroundMusic.mp3","stream")
Music:setLooping(true)
love.audio.play(Music)
ObfuscateFile = io.open("Obfuscate.lua")
OutputFile = io.open("Output.txt","w")
io.input(ObfuscateFile)
Code = io.read("*a")
ObfuscatedCode = [[]]
for Character = 1,#Code do 
ObfuscatedCode = ObfuscatedCode..[[\]]..string.byte(Code,Character,Character)
end
ObfuscateFile:close()
io.input(OutputFile)
OutputFile:write([[load("]]..ObfuscatedCode..[[")()]])
end

function love.draw()
love.graphics.draw(Background,0,0)
love.graphics.draw(Logo,150,50,nil,0.5,nil,6.5,9)
love.graphics.printf("Obfuscation finished, close to output code.", 0, 500, 800, 'center')
end