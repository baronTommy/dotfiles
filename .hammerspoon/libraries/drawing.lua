local drawing = {}

drawing.object = nil

-- 枠線の色のキー名
drawing.drawingColorKeys = {
  'red','blue','green'
}

-- public
--------------------------------------------------------------------------------
-- 枠線削除 & 枠線表示
function drawing.reDrawing()
  -- 枠線削除
  drawing.delete(drawing.object)

  local fw = DEFAULT_FUNCTION.getFocusedWindow()
  if fw == nil then
    -- 対象ウィンドウ無し
    return false
  end

  if fw == hs.window.desktop()then
    -- デスクトップ
    return false
  end

  -- 枠線作成
  drawing.drawingObject = drawing.createDrawngObject(
    DEFAULT_FUNCTION.getWindowSize(),
    SETTING['drawing']['normalBorderWidth'],
    drawing.getRandomBorderColor()
  )

  -- 枠線表示
  drawing.show(drawing.object)
end
--------------------------------------------------------------------------------

-- private
--------------------------------------------------------------------------------
-- 枠線作成
function drawing.createDrawngObject(drawingSize, width, color)

  if drawingSize == nil then
    return
  end

  if width == nil then
    return
  end

  if color == nil then
    return
  end

  -- 枠線サイズ
  drawing.object = drawing.rectangle(drawingSize)

  -- 枠線 太さ
  drawing.object:setStrokeWidth(width)

  -- 枠線 色
  drawing.object:setStrokeColor(color)

  -- 塗りつぶし
  drawing.object:setFill(false)

  return drawing.object
end

-- 枠線表示
function drawing.show(drawingObject)
  drawingObject:show()
end

-- 枠線削除
function drawing.delete(drawingObject)
  if (drawingObject) then
    drawingObject:delete()
    return true
  end
  return false
end

-- 色取得
function drawing.getRandomBorderColor()
  local borderColor = {}
  for k, v in pairs(SETTING['drawing']['colors']) do
    borderColor[v] = math.random(0, 1)
  end
  return borderColor
end

-- 枠線
function drawing.rectangle(drawingSize)
  return hs.drawing.rectangle(
    hs.geometry.rect(
      drawingSize
    )
  )
end
--------------------------------------------------------------------------------

return drawing
