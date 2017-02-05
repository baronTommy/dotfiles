local libraryManager = {}

-- 枠線の色のキー名
libraryManager.borderColorKeys = {
  'red','blue','green'
}

-- 枠線色
function libraryManager.getBorderColor()
  local borderColor = {}
  for k, v in pairs(libraryManager.borderColorKeys) do
    borderColor[v] = math.random(0, 1)
  end
  return borderColor
end

-- 枠線情報
function libraryManager.borderInfo(borderObj, borderWidth)
  -- 塗りつぶし無し
  borderObj:setFill(false)
  -- 線の太さ
  borderObj:setStrokeWidth(borderWidth)
  -- 枠線色
  borderObj:setStrokeColor(libraryManager.getBorderColor())
end

-- 枠線削除
function libraryManager.borderDelete(borderObj)
  if borderObj then
    -- 定義済みの場合削除
    borderObj:delete()
  end
end

return libraryManager
