
import "CoreLibs/object"
import "CoreLibs/graphics"
local gfx <const> = playdate.graphics
import "CoreLibs/sprites"
import "CoreLibs/timer"

local playerSpr = nil

function setup()
	local playerImg = gfx.image.new(70, 16, gfx.kColorBlack)
	assert(playerImg) -- file not found?
	playerSpr = gfx.sprite.new(playerImg)
	-- Use : for calling instance methods (operator passes in 'self')
	playerSpr:moveTo(200,220) -- center of screen 200, 120
	playerSpr:add()

	local backgroundImg = gfx.image.new("images/bg")
	assert(backgroundImg)
	gfx.sprite.setBackgroundDrawingCallback(
		function(x, y, width, height)
	 		-- x, y, width, height is the updated area
			-- in sprite-local coords (already set)
			backgroundImg:draw(0, 0)
		end
	)
end

setup()

function playdate.update()
	-- 30 times / second
	if playdate.buttonIsPressed(playdate.kButtonUp) then
	   playerSpr:moveBy(0, -2)
	end
	if playdate.buttonIsPressed(playdate.kButtonRight) then
	   playerSpr:moveBy(2, 0)
	end
	if playdate.buttonIsPressed(playdate.kButtonDown) then
	   playerSpr:moveBy(0, 2)
	end
	if playdate.buttonIsPressed(playdate.kButtonLeft) then
	   playerSpr:moveBy(-2, 0)
	end

	-- draw sprites, update timers
	playdate.timer.updateTimers()
	gfx.sprite.update()
end
