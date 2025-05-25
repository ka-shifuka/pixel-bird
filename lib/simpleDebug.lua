function createDPrint()
  local y = 100
  return function(text)
    love.graphics.print(text, 100, y)
    y = y + 20
  end
end
