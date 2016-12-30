require "helper"
require "enemy"

keyboard = {}
local keyPadding = 10
local keyShadePadding = 5
local keyDownAnimationTime = 0.1

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
	if love.mouse.isDown(1) then
		if helper.isPointInRect(love.mouse.getX(), love.mouse.getY(), keyboard.firstButton["x"], keyboard.firstButton["y"], keyboard.firstButton["width"], keyboard.firstButton["height"]) then
		    print("first button")
		    enemy.pressedButton(1)
		    if keyboard.firstButton["startTime"] == nil then
		        keyboard.firstButton["y"] = keyboard.firstButton["y"] + keyShadePadding
		    	keyboard.firstButton["startTime"] = love.timer.getTime()
		    end
		elseif helper.isPointInRect(love.mouse.getX(), love.mouse.getY(), keyboard.secondButton["x"], keyboard.secondButton["y"], keyboard.secondButton["width"], keyboard.secondButton["height"]) then
		    print("second button")
		    enemy.pressedButton(2)
		    if keyboard.secondButton["startTime"] == nil then
		        keyboard.secondButton["y"] = keyboard.secondButton["y"] + keyShadePadding
		    	keyboard.secondButton["startTime"] = love.timer.getTime()
		    end
		elseif helper.isPointInRect(love.mouse.getX(), love.mouse.getY(), keyboard.thirdButton["x"], keyboard.thirdButton["y"], keyboard.thirdButton["width"], keyboard.thirdButton["height"]) then
		    print("third button")
		    enemy.pressedButton(3)
		    if keyboard.thirdButton["startTime"] == nil then
		        keyboard.thirdButton["y"] = keyboard.thirdButton["y"] + keyShadePadding
		    	keyboard.thirdButton["startTime"] = love.timer.getTime()
		    end
		elseif helper.isPointInRect(love.mouse.getX(), love.mouse.getY(), keyboard.fourthButton["x"], keyboard.fourthButton["y"], keyboard.fourthButton["width"], keyboard.fourthButton["height"]) then
		    print("fourth button")
		    enemy.pressedButton(4)
		    if keyboard.fourthButton["startTime"] == nil then
		        keyboard.fourthButton["y"] = keyboard.fourthButton["y"] + keyShadePadding
		    	keyboard.fourthButton["startTime"] = love.timer.getTime()
		    end
		elseif helper.isPointInRect(love.mouse.getX(), love.mouse.getY(), keyboard.fifthButton["x"], keyboard.fifthButton["y"], keyboard.fifthButton["width"], keyboard.fifthButton["height"]) then
		    print("fifth button")
		    enemy.pressedButton(5)
		    if keyboard.fifthButton["startTime"] == nil then
		        keyboard.fifthButton["y"] = keyboard.fifthButton["y"] + keyShadePadding
		    	keyboard.fifthButton["startTime"] = love.timer.getTime()
		    end
		elseif helper.isPointInRect(love.mouse.getX(), love.mouse.getY(), keyboard.sixthButton["x"], keyboard.sixthButton["y"], keyboard.sixthButton["width"], keyboard.sixthButton["height"]) then
		    print("sixth button") 
		    enemy.pressedButton(6)
		    if keyboard.sixthButton["startTime"] == nil then
		        keyboard.sixthButton["y"] = keyboard.sixthButton["y"] + keyShadePadding
		    	keyboard.sixthButton["startTime"] = love.timer.getTime()
		    end
		elseif helper.isPointInRect(love.mouse.getX(), love.mouse.getY(), keyboard.seventhButton["x"], keyboard.seventhButton["y"], keyboard.seventhButton["width"], keyboard.seventhButton["height"]) then
		    print("seventh button")
		    enemy.pressedButton(7)
		    if keyboard.seventhButton["startTime"] == nil then
		        keyboard.seventhButton["y"] = keyboard.seventhButton["y"] + keyShadePadding
		    	keyboard.seventhButton["startTime"] = love.timer.getTime()
		    end 
		end
	end
	if keyboard.firstButton["startTime"] and love.timer.getTime() - keyboard.firstButton["startTime"] > keyDownAnimationTime then
	    keyboard.firstButton["y"] = keyboard.y + keyboard.height/2 - keyPadding/2 - keyboard.keyHeight
	    keyboard.firstButton["startTime"] = nil
	end
	if keyboard.secondButton["startTime"] and love.timer.getTime() - keyboard.secondButton["startTime"] > keyDownAnimationTime then
	    keyboard.secondButton["y"] = keyboard.y + keyPadding
	    keyboard.secondButton["startTime"] = nil
	end
	if keyboard.thirdButton["startTime"] and love.timer.getTime() - keyboard.thirdButton["startTime"] > keyDownAnimationTime then
	    keyboard.thirdButton["y"] = keyboard.y + keyboard.height/2 - keyPadding/2 - keyboard.keyHeight
	    keyboard.thirdButton["startTime"] = nil
	end
	if keyboard.fourthButton["startTime"] and love.timer.getTime() - keyboard.fourthButton["startTime"] > keyDownAnimationTime then
	    keyboard.fourthButton["y"] = keyboard.y + keyPadding * 2 + keyboard.keyHeight
	    keyboard.fourthButton["startTime"] = nil
	end
	if keyboard.fifthButton["startTime"] and love.timer.getTime() - keyboard.fifthButton["startTime"] > keyDownAnimationTime then
	    keyboard.fifthButton["y"] = keyboard.y + keyPadding * 3 + keyboard.keyHeight * 2
	    keyboard.fifthButton["startTime"] = nil
	end
	if keyboard.sixthButton["startTime"] and love.timer.getTime() - keyboard.sixthButton["startTime"] > keyDownAnimationTime then
	    keyboard.sixthButton["y"] = keyboard.y + keyboard.height/2 + keyPadding/2
	    keyboard.sixthButton["startTime"] = nil
	end
	if keyboard.seventhButton["startTime"] and love.timer.getTime() - keyboard.seventhButton["startTime"] > keyDownAnimationTime then
	    keyboard.seventhButton["y"] = keyboard.y + keyboard.height/2 + keyPadding/2
	    keyboard.seventhButton["startTime"] = nil
	end
end

function keyboard.draw()
	love.graphics.setColor(keyboard.red, keyboard.green, keyboard.blue)
	love.graphics.rectangle("fill", 0, keyboard.y, love.graphics.getWidth(), keyboard.height)

	-- first button
	if keyboard.firstButton["startTime"] == nil then
	   love.graphics.setColor(149,54,57)
		love.graphics.rectangle("fill", keyboard.firstButton["x"], keyboard.firstButton["y"], keyboard.firstButton["width"], keyboard.firstButton["height"], 10, 10)
	end
	love.graphics.setColor(213,78,83)
	love.graphics.rectangle("fill", keyboard.firstButton["x"], keyboard.firstButton["y"], keyboard.firstButton["width"], keyboard.firstButton["height"] - keyShadePadding, 10, 10)
	-- second button
	if keyboard.secondButton["startTime"] == nil then
	   love.graphics.setColor(161,97,48)
		love.graphics.rectangle("fill", keyboard.secondButton["x"], keyboard.secondButton["y"], keyboard.secondButton["width"], keyboard.secondButton["height"], 10, 10)
	end
	love.graphics.setColor(231,140,69)
	love.graphics.rectangle("fill", keyboard.secondButton["x"], keyboard.secondButton["y"], keyboard.secondButton["width"], keyboard.secondButton["height"] - keyShadePadding, 10, 10)
	-- thrid button
	if keyboard.thirdButton["startTime"] == nil then
	   love.graphics.setColor(161,137,49)
		love.graphics.rectangle("fill", keyboard.thirdButton["x"], keyboard.thirdButton["y"], keyboard.thirdButton["width"], keyboard.thirdButton["height"], 10, 10)
	end
	love.graphics.setColor(231,197,71)
	love.graphics.rectangle("fill", keyboard.thirdButton["x"], keyboard.thirdButton["y"], keyboard.thirdButton["width"], keyboard.thirdButton["height"] - keyShadePadding, 10, 10)
	-- fourth button
	if keyboard.fourthButton["startTime"] == nil then
	   love.graphics.setColor(129,141,51)
		love.graphics.rectangle("fill", keyboard.fourthButton["x"], keyboard.fourthButton["y"], keyboard.fourthButton["width"], keyboard.fourthButton["height"], 10, 10)
	end
	love.graphics.setColor(185,202,74)
	love.graphics.rectangle("fill", keyboard.fourthButton["x"], keyboard.fourthButton["y"], keyboard.fourthButton["width"], keyboard.fourthButton["height"] - keyShadePadding, 10, 10)
	-- fifth button
	if keyboard.fifthButton["startTime"] == nil then
	   love.graphics.setColor(85,115,152)
		love.graphics.rectangle("fill", keyboard.fifthButton["x"], keyboard.fifthButton["y"], keyboard.fifthButton["width"], keyboard.fifthButton["height"], 10, 10)
	end
	love.graphics.setColor(122,166,218)
	love.graphics.rectangle("fill", keyboard.fifthButton["x"], keyboard.fifthButton["y"], keyboard.fifthButton["width"], keyboard.fifthButton["height"] - keyShadePadding, 10, 10)
	-- sixth button
	if keyboard.sixthButton["startTime"] == nil then
	   love.graphics.setColor(78,134,123)
		love.graphics.rectangle("fill", keyboard.sixthButton["x"], keyboard.sixthButton["y"], keyboard.sixthButton["width"], keyboard.sixthButton["height"], 10, 10)
	end
	love.graphics.setColor(112,192,177)
	love.graphics.rectangle("fill", keyboard.sixthButton["x"], keyboard.sixthButton["y"], keyboard.sixthButton["width"], keyboard.sixthButton["height"] - keyShadePadding, 10, 10)
	-- seventh button
	if keyboard.seventhButton["startTime"] == nil then
	   love.graphics.setColor(136,105,151)
		love.graphics.rectangle("fill", keyboard.seventhButton["x"], keyboard.seventhButton["y"], keyboard.seventhButton["width"], keyboard.seventhButton["height"], 10, 10)
	end
	love.graphics.setColor(195,151,216)
	love.graphics.rectangle("fill", keyboard.seventhButton["x"], keyboard.seventhButton["y"], keyboard.seventhButton["width"], keyboard.seventhButton["height"] - keyShadePadding, 10, 10)
	
	love.graphics.setColor(255, 255, 255)
end