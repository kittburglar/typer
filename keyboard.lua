keyboard = {}
local keyPadding = 10
local keyShadePadding = 5

function keyboard.load()
	keyboard.height = 216
	keyboard.y = love.graphics.getHeight() - keyboard.height
	keyboard.red = 42
	keyboard.green = 42
	keyboard.blue = 42
	keyboard.keyWidth = (love.graphics.getWidth() - keyPadding * 4) / 3
	keyboard.keyHeight = (keyboard.height - keyPadding * 4) / 3
	keyboard.firstButton = {["x"] = keyPadding, ["y"] = keyboard.y + keyboard.height/2 - keyPadding/2 - keyboard.keyHeight, ["width"] = keyboard.keyWidth, ["height"] = keyboard.keyHeight}
	keyboard.secondButton = {["x"] = keyPadding * 2 + keyboard.keyWidth, ["y"] = keyboard.y + keyPadding, ["width"] = keyboard.keyWidth, ["height"] = keyboard.keyHeight}
	keyboard.thirdButton = {["x"] = keyPadding * 3 + keyboard.keyWidth * 2, ["y"] = keyboard.y + keyboard.height/2 - keyPadding/2 - keyboard.keyHeight, ["width"] = keyboard.keyWidth, ["height"] = keyboard.keyHeight}
	keyboard.fourthButton = {["x"] = keyPadding * 2 + keyboard.keyWidth, ["y"] = keyboard.y + keyPadding * 2 + keyboard.keyHeight, ["width"] = keyboard.keyWidth, ["height"] = keyboard.keyHeight}
	keyboard.fifthButton = {["x"] = keyPadding * 2 + keyboard.keyWidth, ["y"] = keyboard.y + keyPadding * 3 + keyboard.keyHeight * 2, ["width"] = keyboard.keyWidth, ["height"] = keyboard.keyHeight}
	keyboard.sixthButton = {["x"] = keyPadding, ["y"] = keyboard.y + keyboard.height/2 + keyPadding/2, ["width"] = keyboard.keyWidth, ["height"] = keyboard.keyHeight}
	keyboard.seventhButton = {["x"] = keyPadding * 3 + keyboard.keyWidth * 2, ["y"] = keyboard.y + keyboard.height/2 + keyPadding/2, ["width"] = keyboard.keyWidth, ["height"] = keyboard.keyHeight}
	
end

function keyboard.update(dt)
end

function keyboard.draw()
	love.graphics.setColor(keyboard.red, keyboard.green, keyboard.blue)
	love.graphics.rectangle("fill", 0, keyboard.y, love.graphics.getWidth(), keyboard.height)
	-- first button
	love.graphics.setColor(149,54,57)
	love.graphics.rectangle("fill", keyboard.firstButton["x"], keyboard.firstButton["y"], keyboard.firstButton["width"], keyboard.firstButton["height"], 10, 10)
	love.graphics.setColor(213,78,83)
	love.graphics.rectangle("fill", keyboard.firstButton["x"], keyboard.firstButton["y"], keyboard.firstButton["width"], keyboard.firstButton["height"] - keyShadePadding, 10, 10)
	-- second button
	love.graphics.setColor(161,97,48)
	love.graphics.rectangle("fill", keyboard.secondButton["x"], keyboard.secondButton["y"], keyboard.secondButton["width"], keyboard.secondButton["height"], 10, 10)
	love.graphics.setColor(231,140,69)
	love.graphics.rectangle("fill", keyboard.secondButton["x"], keyboard.secondButton["y"], keyboard.secondButton["width"], keyboard.secondButton["height"] - keyShadePadding, 10, 10)
	-- thrid button
	love.graphics.setColor(161,137,49)
	love.graphics.rectangle("fill", keyboard.thirdButton["x"], keyboard.thirdButton["y"], keyboard.thirdButton["width"], keyboard.thirdButton["height"], 10, 10)
	love.graphics.setColor(231,197,71)
	love.graphics.rectangle("fill", keyboard.thirdButton["x"], keyboard.thirdButton["y"], keyboard.thirdButton["width"], keyboard.thirdButton["height"] - keyShadePadding, 10, 10)
	-- fourth button
	love.graphics.setColor(129,141,51)
	love.graphics.rectangle("fill", keyboard.fourthButton["x"], keyboard.fourthButton["y"], keyboard.fourthButton["width"], keyboard.fourthButton["height"], 10, 10)
	love.graphics.setColor(185,202,74)
	love.graphics.rectangle("fill", keyboard.fourthButton["x"], keyboard.fourthButton["y"], keyboard.fourthButton["width"], keyboard.fourthButton["height"] - keyShadePadding, 10, 10)
	-- fifth button
	love.graphics.setColor(85,115,152)
	love.graphics.rectangle("fill", keyboard.fifthButton["x"], keyboard.fifthButton["y"], keyboard.fifthButton["width"], keyboard.fifthButton["height"], 10, 10)
	love.graphics.setColor(122,166,218)
	love.graphics.rectangle("fill", keyboard.fifthButton["x"], keyboard.fifthButton["y"], keyboard.fifthButton["width"], keyboard.fifthButton["height"] - keyShadePadding, 10, 10)
	-- sixth button
	love.graphics.setColor(78,134,123)
	love.graphics.rectangle("fill", keyboard.sixthButton["x"], keyboard.sixthButton["y"], keyboard.sixthButton["width"], keyboard.sixthButton["height"], 10, 10)
	love.graphics.setColor(112,192,177)
	love.graphics.rectangle("fill", keyboard.sixthButton["x"], keyboard.sixthButton["y"], keyboard.sixthButton["width"], keyboard.sixthButton["height"] - keyShadePadding, 10, 10)
	-- seventh button
	love.graphics.setColor(136,105,151)
	love.graphics.rectangle("fill", keyboard.seventhButton["x"], keyboard.seventhButton["y"], keyboard.seventhButton["width"], keyboard.seventhButton["height"], 10, 10)
	love.graphics.setColor(195,151,216)
	love.graphics.rectangle("fill", keyboard.seventhButton["x"], keyboard.seventhButton["y"], keyboard.seventhButton["width"], keyboard.seventhButton["height"] - keyShadePadding, 10, 10)
	love.graphics.setColor(255, 255, 255)


end