class('Paddle').extends(gfx.sprite)

function Paddle:init()
    Paddle.super.init(self)
    self:setImage(gfx.image.new(70, 16, gfx.kColorBlack))
    self:moveTo(200, 220)
    self:add()
end

function Paddle:update()
    Paddle.super.update(self)
    local speed = 5

	if playdate.buttonIsPressed(playdate.kButtonRight)
	and self.x < 400 then
	   self:moveBy(speed, 0)
	end
	if playdate.buttonIsPressed(playdate.kButtonLeft)
	and self.x > 0 then
	   self:moveBy(-speed, 0)
	end
	if self.x < 0 then self:moveTo(0, self.y) end
	if self.x > 400 then self:moveTo(400, self.y) end

end
