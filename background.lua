function createBackground(path)
  local background = {}
  background.x = 0
  background.y = 0
  background.alpha = 1
  background.image = love.graphics.newImage(path)

  function background:update(dt)
    self.x = self.x - 20 * dt

    if self.x < -(self.image:getWidth() * 2) then
      self.x = 0
    end
  end

  function background:draw()
    love.graphics.push()
    love.graphics.translate(self.x, self.y)

    love.graphics.scale(2, 3)
    love.graphics.draw(self.image, 0, 0)
    love.graphics.draw(self.image, self.image:getWidth(), 0)

    love.graphics.pop()
  end

  return background
end

backgrounds = {
  createBackground("asset/Background/Background1.png"),
  createBackground("asset/Background/Background6.png"),
  createBackground("asset/Background/Background7.png"),
  createBackground("asset/Background/Background8.png"),
}

backgroundSystem = {}
backgroundSystem.bgIndex = 2
backgroundSystem.count = 0
backgroundSystem.alphaCurrent = 1

function backgroundSystem:update()
  local maximum = 1000

  if self.count > maximum then
    self.bgIndex = self.bgIndex + 1
    self.count = 0
    self.alphaCurrent = 1
  end
  if self.bgIndex > #backgrounds then
    self.bgIndex = 1
  end
  if self.count > maximum - 50 then
    self.alphaCurrent = self.alphaCurrent - (1 / 50)
  end

  self.count = self.count + 1
end

function backgroundSystem:draw()
  if self.bgIndex < #backgrounds then
    backgrounds[self.bgIndex + 1]:draw()
  else
    backgrounds[1]:draw()
  end
  love.graphics.setColor(1, 1, 1, self.alphaCurrent)
  backgrounds[self.bgIndex]:draw()
  love.graphics.setColor(1, 1, 1, 1)
end

ground = {}
ground.x = 0
ground.y = love.graphics.getHeight() - 100
ground.image = love.graphics.newImage("asset/ground.png")

function ground:update(dt)
  self.x = self.x - 100 * dt

  if self.x < -(self.image:getWidth() * 4) then
    self.x = 0
  end
end

function ground:draw()
  love.graphics.push()
  love.graphics.translate(self.x, self.y)

  love.graphics.scale(4)
  love.graphics.draw(self.image, 0, 0)
  love.graphics.draw(self.image, self.image:getWidth(), 0)
  love.graphics.draw(self.image, self.image:getWidth() * 2, 0)

  love.graphics.scale(-1)
  love.graphics.draw(self.image, -self.image:getWidth(), -self.image:getHeight() * 2)
  love.graphics.draw(self.image, -self.image:getWidth() * 2, -self.image:getHeight() * 2)
  love.graphics.draw(self.image, -self.image:getWidth() * 3, -self.image:getHeight() * 2)

  love.graphics.pop()
end
