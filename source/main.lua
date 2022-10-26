
import "CoreLibs/object"
import "CoreLibs/graphics"
local gfx <const> = playdate.graphics
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "paddle"

local paddle = Paddle()

function setup()	
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
	-- 30 times per second (?)

	if playdate.buttonIsPressed(playdate.kButtonLeft) then
		paddle:left()
	end
	if playdate.buttonIsPressed(playdate.kButtonRight) then
		paddle:right()
	end

	-- draw sprites, update timers
	playdate.timer.updateTimers()
	gfx.sprite.update()
end
