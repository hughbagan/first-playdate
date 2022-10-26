class('Paddle').extends(playdate.graphics.sprite)

local gfx <const> = playdate.graphics

function Paddle:init()
    Paddle.super.init(self)
	
    -- Use : for calling instance methods (operator passes in 'self')
	self:setImage(gfx.image.new(70, 16, gfx.kColorBlack))
    self:moveTo(200,220) -- center of screen 200, 120
	self:addSprite()

    self.speed = 10
end

function Paddle:left()
    if self.x > 0 then
        self:moveBy(-self.speed, 0)
    end
    if self.x < 0 then self:moveTo(0, self.y) end
end

function Paddle:right()
    if self.x < 400 then
        self:moveBy(self.speed, 0)
    end
    if self.x > 400 then self:moveTo(400, self.y) end
end