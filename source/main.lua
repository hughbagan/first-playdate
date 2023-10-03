import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/object"
gfx = playdate.graphics
tmr = playdate.timer

WIDTH = playdate.display.getWidth() -- center of screen 200, 120
HEIGHT = playdate.display.getHeight()

import "Paddle"
import "Ball"

State = {START=1, PLAY=2}
state = State.START
local paddle = nil
local ball = nil

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
	paddle = Paddle()
	ball = Ball()
end

function playdate.update() -- 30 times / second
	if state == State.START then
		gfx.drawText('Press A', WIDTH*0.5, HEIGHT*0.5)
		if playdate.buttonIsPressed(playdate.kButtonA) then
			setup()
			state = State.PLAY
		end
	elseif state == State.PLAY then
		-- draw sprites, update timers
		tmr.updateTimers()
		gfx.sprite.update()
	else
		assert(false, "state "..state.." not recognized")
	end
end

