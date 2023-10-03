class('Ball').extends(gfx.sprite)

function Ball:init()
    Ball.super.init(self)
	local img = gfx.image.new("images/ball.png")
	assert(img)
    self:setImage(img)
    self:moveTo(200, 120)

	self.speedX = 1
	self.speedY = 1

    self:add()
end

function Ball:update()
    Ball.super.update(self)

	self:moveTo(self.x+self.speedX, self.y+self.speedY)
	if self.x >= WIDTH or self.x <= 0 then
		self.speedX = -self.speedX
	end
	if self.y >= HEIGHT or self.y <= 0 then
		self.speedY = -self.speedY
	end
end
