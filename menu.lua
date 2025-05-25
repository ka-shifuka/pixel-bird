local gr = love.graphics

gooi.setStyle({
  bgColor = { 1, 1, 1, 0 }
})
gooi.newButton({
  text = "",
  x = 0,
  y = 0,
  w = gr.getWidth(),
  h = gr.getHeight(),
  group = "play"
}):onPress(function()
  if gameState == 1 then
    player:jump()
    soundEffect.jump:setVolume(60)
    soundEffect.jump:clone():play()
  end

  if gameState == 0 then
    gameState = 1
    player:jump()
  end

  gooi.setGroupVisible("playUi", true)
  gooi.setGroupVisible("startMenu", false)
end)

gooi.setStyle({
  bgColor = { 0, 0, 0, 0.2 },
  font = gr.newFont("asset/font.ttf", 14)
})
gooi.newButton({
  x = 20,
  y = gr.getHeight() - 70,
  w = 50,
  h = 50,

  text = "menu",
  group = "playUi"
}):onPress(function()
  soundEffect.jump:setVolume(0)
  gameState = 0
end)

--- label
gooi.setStyle({
  bgColor = { 0, 0, 0, 0 },
  font = gr.newFont("asset/font.ttf", 20)
})
gooi.newButton({
  x = gr.getWidth() / 2 - 100,
  y = gr.getHeight() / 2,
  w = 200,
  text = "Tap anywhare to start",
  group = "startMenu"
})

gooi.setStyle({ font = gr.newFont("asset/font.ttf", 15) })
gooi.newButton({
  x = gr.getWidth() / 2 - 100,
  y = gr.getHeight() / 2 + 200,
  w = 200,
  text = "by arya (ka-shifuka)",
  group = "startMenu"
})

gooi.setStyle({ font = gr.newFont("asset/font.ttf", 20) })
scoreLabel = gooi.newButton({
  x = gr.getWidth() / 2 - 50,
  y = gr.getHeight() - 70,
  w = 100,

  group = "playUi"
})

gooi.setStyle({ bgColor = { 0, 0, 0, 0.4 } })
gooi.newButton({
  x = 0,
  y = 0,
  w = gr.getWidth(),
  h = gr.getHeight(),
  text = "",
  group = "gameOver"
})

gooi.setStyle({ bgColor = { 0, 0, 0, 0 } })
gooi.newButton({
  x = gr.getWidth() / 2 - 10,
  y = gr.getHeight() / 2,
  w = 20,
  text = "Game Over\nTap to Start",
  group = "gameOver"
})
