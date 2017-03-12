local drawing = {}

-- 枠線
drawing.objectDrawing = nil

-- public
--------------------------------------------------------------------------------
-- 枠線削除 & 枠線表示
function drawing.reDrawing()
  -- 枠線削除
  drawing.delete(drawing.objectDrawing)

  drawing.objectDrawing = drawing.create(
    DEFAULT_FUNCTION.getFocusedWindow(),
    false,
    DEFAULT_FUNCTION.getWindowSize(),
    drawing.getRandomBorderColor(),
    nil,
    SETTING['drawing']['normalBorderWidth']
  )

  if drawing.objectDrawing then
    -- 枠線表示
    drawing.show(drawing.objectDrawing)
  end
end

--------------------------------------------------------------------------------

-- private
--------------------------------------------------------------------------------
-- 枠線作成
function drawing.create(fw, fill, drawingSize, color, fillColor, width)
  if fw == nil then
    -- 対象ウィンドウ無し
    return false
  end

  if fw == hs.window.desktop()then
    -- デスクトップ
    return false
  end

  if drawingSize == nil then
    return false
  end

  if width == nil then
    return false
  end

  if color == nil then
    return false
  end

  local drawingObj = nil

  -- 枠線サイズ
  drawingObj = drawing.rectangle(drawingSize)

  -- 枠線 太さ
  drawingObj:setStrokeWidth(width)

  -- 枠線 色
  drawingObj:setStrokeColor(color)

  -- 塗りつぶし
  drawingObj:setFill(fill)

  -- 塗りつぶし色
  if fillColor then
    drawingObj:setFillColor(fillColor)
  end

  return drawingObj
end

-- 枠線表示
function drawing.show(drawingObject)
  if drawingObject then
    drawingObject:show()
    return true
  end
  return false
end

-- 枠線削除
function drawing.delete(drawingObject)
  if drawingObject then
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
