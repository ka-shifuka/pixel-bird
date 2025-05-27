local a8 = require "lib.anim8"

player = {}
player.score = 0

player.x = love.graphics.getWidth() / 2 - 10
player.y = love.graphics.getHeight() / 2
player.angle = 0
player.angleT = 0.05
player.angleV = 0

-- gravity force
player.velocity = 0
player.gravity = 10

-- image sprite sheet (anim 8)
player.anim = {}
player.anim.image = love.graphics.newImage("asset/bird.png")
player.anim.grid = a8.newGrid(16, 16, player.anim.image:getWidth(), player.anim.image:getHeight())
player.anim.animation = a8.newAnimation(player.anim.grid("1-4", 1), 0.2)
player.anim.duration = 50

-- method
function player:update(dt)
  if self.y >= ground.y then
    self.y = ground.y
    self.velocity = -(self.velocity / 2)
    self.angle = 0
    self.angleV = 0

    soundEffect.bounce:play()
  end
  self.velocity = self.velocity + self.gravity * dt
  self.y = self.y + self.velocity

  self.angleV = self.angleV + self.angleT * dt
  self.angle = self.angle + self.angleV
  if self.angle >= math.pi / 8 then
    self.angle = math.pi / 8
  end

  if self.y < -700 then
    player.y = love.graphics.getHeight() / 2
    player.velocity = 0
  end

  self.anim.duration = self.anim.duration - 1
  self.anim.animation:update(dt)
end

function player:detectCollision(pipe)
  local ll = pipe:getAboveCollision()
  local pp = pipe:getBellowCollision()

  if self.x + 8 > ll.x and self.x + 8 < ll.x + ll.w then
    if self.y - 8 > ll.y and self.y - 8 < ll.y + ll.h then
      gameState = 2
    end

    if self.y + 8 > pp.y and self.y + 8 < pp.y + pp.h then
      gameState = 2
    end
  end

  if self.x > ll.x + ll.w and pipe.isCrossing == false then
    self.score = self.score + 1
    pipe.isCrossing = true
  end
end

function player:jump()
  self.velocity = -6
  self.angle = -(math.pi / 7)
  self.anim.duration = 30
  self.anim.animation:gotoFrame(2)
  self.angleV = 0
end

function player:draw()
  love.graphics.push()
  love.graphics.translate(self.x, self.y)

  love.graphics.scale(2)
  love.graphics.rotate(self.angle)

  if self.anim.duration < 0 then
    self.anim.animation:gotoFrame(1)
  end
  self.anim.animation:draw(self.anim.image, -(16 / 2), -(16 / 2))

  love.graphics.pop()
end
