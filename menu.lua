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
end)

-- menu
gooi.setStyle({
  bgColor = { 0, 0, 0, 0.2 },
  font = gr.newFont("asset/font.ttf", 20)
})
gooi.newButton({
  x = 20,
  y = gr.getHeight() - 70,
  w = 50,
  h = 50,

  text = "󰏤",
  group = "playUi"
}):onPress(function()
  soundEffect.jump:setVolume(0)
  gameState = 3
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

-- game over
gooi.setStyle({ bgColor = { 0, 0, 0, 0.4 } })
gooi.newButton({
  x = 0,
  y = 0,
  w = gr.getWidth(),
  h = gr.getHeight(),
  text = "",
  group = "gameOver"
}):onRelease(function()
  gameState = 1
  pipes = {}
  player.score = 0
end)

gooi.setStyle({ bgColor = { 0, 0, 0, 0 } })
gooi.newButton({
  x = gr.getWidth() / 2 - 10,
  y = gr.getHeight() / 2,
  w = 20,
  text = "Game Over\nTap to Start",
  group = "gameOver"
})

gooi.newButton({
  x = gr.getWidth() / 2 - 10,
  y = gr.getHeight() / 2 + 170,
  w = 20,
  text = "score",
  group = "gameOver"
})

gooi.setStyle({ font = gr.newFont("asset/font.ttf", 40) })
gameOverScoreText = gooi.newButton({
  x = gr.getWidth() / 2 - 10,
  y = gr.getHeight() / 2 + 200,
  w = 20,
  text = "0",
  group = "gameOver"
})

-- pause
gooi.setStyle({
  bgColor = { 0, 0, 0, 0.4 },
  font = gr.newFont("asset/font.ttf", 16)
})
gooi.newButton({
  x = 0,
  y = 0,
  w = gr.getWidth(),
  h = gr.getHeight(),
  text = "",
  group = "pauseUi"
})
gooi.newLabel({
  x = 40,
  y = 300,
  text = "Create with Love2D",
  group = "pauseUi"
})
gooi.newLabel({
  x = 40,
  y = 320,
  text = "Develope by arya (ka-shifuka)",
  group = "pauseUi"
})

gooi.newLabel({
  x = 40,
  y = 470,
  text = "email: aryadewanggapuja@gmail.com",
  group = "pauseUi"
})

-- hyperlink
gooi.newPanel({
  x = gr.getWidth() / 2 - 175,
  y = 500,
  w = 350,
  h = 50,
  layout = "grid 1x3",
  group = "pauseUi"
}):add(
  gooi.newButton({
    x = 50,
    y = 340,
    text = "github"
  }):onPress(function()
    love.system.openURL("https://github.com/ka-shifuka")
  end),

  gooi.newButton({
    x = 150,
    y = 340,
    text = "facebook"
  }):onPress(function()
    love.system.openURL("https://www.facebook.com/aryadewanggapuja")
  end),

  gooi.newButton({
    x = 150,
    y = 340,
    text = "instagram"
  }):onPress(function ()
    love.system.openURL("https://www.instagram.com/aryadewanggapuja?igsh=YzljYTk1ODg3Zg==")
  end)
)
-- hyperlink

gooi.setStyle({ font = gr.newFont("asset/font.ttf", 16) })
gooi.newButton({
  x = gr.getWidth() / 2 - 50,
  y = gr.getHeight() / 2 + 300,
  w = 100,
  h = 50,
  text = "resume",
  group = "pauseUi"
}):onPress(function()
  gameState = 1
end)
