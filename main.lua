function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest")
  require "gooi"
  require "menu"
  require "background"
  require "pipe"
  require "player"

  bgmusic = love.audio.newSource("asset/sound/bgmusic-jungle-waves.mp3", "stream")
  bgmusic:setLooping(true)
  bgmusic:play()


  soundEffect = {}
  soundEffect.jump = love.audio.newSource("asset/sound/jump.mp3", "static")
  soundEffect.bounce = love.audio.newSource("asset/sound/bounce.mp3", "static")

  pipes = {}
  timer = 0
  timerEnd = 300

  gooi.setGroupVisible("playUi", false)
  gooi.setGroupVisible("gameOver", false)
  gooi.setGroupVisible("pauseUi", false)

  gameState = 0
end

function love.update(dt)
  if gameState == 1 then
    player:update(dt)
    ground:update(dt)

    for index, bg in ipairs(backgrounds) do
      bg:update(dt)
      bg.x = bg.x + -(index * 0.2)
    end

    backgroundSystem:update()

    if timer > timerEnd then
      local x = math.random(love.graphics.getWidth() + 100, love.graphics.getWidth() + 150)
      local y = math.random(200, 600)
      local pipe = createPipe(x, y)
      table.insert(pipes, pipe)

      timer = 0
      if timerEnd > 250 then
        timerEnd = timerEnd - 5
      end
    end
    timer = timer + 1

    for _, pipe in ipairs(pipes) do
      pipe:update(dt)
      player:detectCollision(pipe)
    end

    if #pipes > 5 then
      table.remove(pipes, 1)
    end
  end

  if gameState == 3 then
    gooi.setGroupVisible("pauseUi", true)
    gooi.setGroupVisible("gameOver", false)
    gooi.setGroupVisible("play", false)
    gooi.setGroupVisible("playUi", false)
    gooi.setGroupVisible("startMenu", false)
  end

  if gameState == 2 then
    gooi.setGroupVisible("pauseUi", false)
    gooi.setGroupVisible("gameOver", true)
    gooi.setGroupVisible("play", false)
    gooi.setGroupVisible("playUi", false)
    gooi.setGroupVisible("startMenu", false)
  end

  if gameState == 1 then
    gooi.setGroupVisible("pauseUi", false)
    gooi.setGroupVisible("gameOver", false)
    gooi.setGroupVisible("play", true)
    gooi.setGroupVisible("playUi", true)
    gooi.setGroupVisible("startMenu", false)
  end
  gooi.update(dt)

  scoreLabel:setText(player.score)
  gameOverScoreText:setText(player.score)
end

function love.draw()
  love.graphics.setBackgroundColor(0, 0, 0, 1)

  backgroundSystem:draw()
  ground:draw()
  player:draw()

  for _, pipe in ipairs(pipes) do
    pipe:draw()
  end

  gooi.draw("play")
  gooi.draw("playUi")
  gooi.draw("startMenu")
  gooi.draw("gameOver")
  gooi.draw("pauseUi")
  gooi.draw()
end

function love.touchpressed(id, x, y)
  gooi.pressed(id, x, y)
end

function love.touchreleased(id, x, y)
  gooi.released(id, x, y)
end

function love.mousepressed(x, y, btn)
  gooi.pressed()
end

function love.mousereleased(x, y, btn)
  gooi.released()
end
