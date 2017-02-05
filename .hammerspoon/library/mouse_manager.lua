local mouseManager = {}
mouseManager.libraryManager = require ('library/library_manager')

-- 枠線
mouseManager.borderObj = nil

-- 枠線太さ
mouseManager.borderWidth = 5

-- 枠線 円の直径
mouseManager.diameter = 100

-- 枠線削除時間
mouseManager.autoDeleteTimeSeconds = 1

-- public ------------------------------------------------
function mouseManager.init()
  mouseManager.mouseMoved = hs.eventtap.new({ hs.eventtap.event.types.mouseMoved }, function() mouseManager.borderShow() end)
  mouseManager.leftMouseDragged = hs.eventtap.new({ hs.eventtap.event.types.leftMouseDragged }, function() mouseManager.borderShow() end)
  mouseManager.rightMouseDragged = hs.eventtap.new({ hs.eventtap.event.types.rightMouseDragged }, function() mouseManager.borderShow() end)

  mouseManager.mouseMoved:start()
  mouseManager.leftMouseDragged:start()
  mouseManager.rightMouseDragged:start()
end

-- 枠線表示
function mouseManager.borderShow()
  mouseManager.borderDelete()
  mouseManager.createMouseBorder()

  -- 枠線表示
  mouseManager.borderObj:show()

  -- 枠線自動削除
  hs.timer.doAfter(mouseManager.autoDeleteTimeSeconds, function() mouseManager.borderDelete() end)
end

-- 枠線削除
function mouseManager.borderDelete()
  mouseManager.libraryManager.borderDelete(mouseManager.borderObj)
end
------------------------------------------------------

-- get -----------------------------------------------
function mouseManager.getMouseRadiusSize(mousepoint)
  -- マウス位置
  local mousepoint = hs.mouse.getAbsolutePosition ()

  -- 半径
  local radius = math.floor(mouseManager.diameter / 2)

  local size = {}
  size.x = mousepoint.x - radius
  size.y = mousepoint.y - radius
  size.w = mouseManager.diameter
  size.h = mouseManager.diameter
  return size
end
------------------------------------------------------

------------------------------------------------------
-- 枠線情報セット
function mouseManager.createMouseBorder()
  mouseManager.borderObj = hs.drawing.circle(hs.geometry.rect(mouseManager.getMouseRadiusSize(mousepoint)))
  mouseManager.libraryManager.borderInfo(mouseManager.borderObj, mouseManager.borderWidth)
end
------------------------------------------------------

return mouseManager
