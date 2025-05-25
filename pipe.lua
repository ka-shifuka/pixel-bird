local a8 = require "lib.anim8"

function createPipe(x, y)
  local pipe = {}
  pipe.x = x or 300
  pipe.y = y or 300
  pipe.gap = math.random(150, 300)
  pipe.images = {
    love.graphics.newImage("asset/pipe_1.png"),
    love.graphics.newImage("asset/pipe_2.png"),
    love.graphics.newImage("asset/pipe_3.png"),
    love.graphics.newImage("asset/pipe_4.png"),
  }

  pipe.isCrossing = false

  pipe.ranIndex = {
    math.random(1, 4),
    math.random(1, 4),
  }

  -- grid refferance
  pipe.grid = a8.newGrid(32, 30, pipe.images[1]:getWidth(), pipe.images[1]:getHeight())

  pipe.head = a8.newAnimation(pipe.grid("1-1", 1), 1)
  pipe.tail = a8.newAnimation(pipe.grid("1-1", 2), 1)

  function pipe:update(dt)
    self.x = self.x - 100 * dt
  end

  function pipe:draw()
    love.graphics.push()
    love.graphics.translate(self.x, self.y)
    love.graphics.scale(-3)
    self.head:draw(self.images[self.ranIndex[1]], -(32), 0)
    self.tail:draw(self.images[self.ranIndex[1]], -(32), 30)
    self.tail:draw(self.images[self.ranIndex[1]], -(32), 30 * 2)
    self.tail:draw(self.images[self.ranIndex[1]], -(32), 30 * 3)
    self.tail:draw(self.images[self.ranIndex[1]], -(32), 30 * 4)
    self.tail:draw(self.images[self.ranIndex[1]], -(32), 30 * 5)
    self.tail:draw(self.images[self.ranIndex[1]], -(32), 30 * 6)
    love.graphics.pop()

    love.graphics.push()
    love.graphics.translate(self.x, self.y + self.gap)
    love.graphics.scale(3)
    self.head:draw(self.images[self.ranIndex[2]], 0, 0)
    self.tail:draw(self.images[self.ranIndex[2]], 0, 30)
    self.tail:draw(self.images[self.ranIndex[2]], 0, 30 * 2)
    self.tail:draw(self.images[self.ranIndex[2]], 0, 30 * 3)
    self.tail:draw(self.images[self.ranIndex[2]], 0, 30 * 4)
    self.tail:draw(self.images[self.ranIndex[2]], 0, 30 * 5)
    self.tail:draw(self.images[self.ranIndex[2]], 0, 30 * 6)
    love.graphics.pop()
  end

  function pipe:getAboveCollision()
    local x = self.x
    local y = self.y - (30 * 7) * 3
    local w = 32 * 3
    local h = (30 * 7) * 3

    return { x = x, y = y, w = w, h = h }
  end

  function pipe:getBellowCollision()
    local x = self.x
    local y = self.y + self.gap
    local w = 32 * 3
    local h = (30 * 7) * 3

    return { x = x, y = y, w = w, h = h }
  end

  return pipe
end
