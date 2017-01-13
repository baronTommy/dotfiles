local windowManager = {}
-- 枠線太さ
windowManager.normalBorderWidth = 4
windowManager.newBorderWidth = 200

-- ピカピカ
windowManager.shinySpeed = 0.1

-- 現在フォーカスがあるウィンドウ
windowManager.focusedWindow = nil

-- フォーカス移動先候補
windowManager.targetWindowCandidate = nil

-- フォーカスウィンドウサイズ
windowManager.focusedWindowSize = {}

-- 枠線
windowManager.borderObj = nil

-- 枠線の色のキー名
windowManager.borderColorKeys = {
  'red','blue','green'
}

-- 全ウィンドウ
windowManager.allWindows = nil

-- ウィンドウフォーカスが変更された
windowManager.newFocusedWindowFlg = nil

-- ウィンドウ監視
windowManager.windowWatcher = nil

-- スペース監視
windowManager.spacesWatcher = nil

-- ウィンドウ方向 変換
windowManager.direction = {
  U = 'North',
  D = 'South',
  L = 'West',
  R = 'East',
}
-- public ------------------------------------------------
function windowManager.init()
  windowManager.changeFocusedWindowEvent()
  -- フォーカスが外れた場合
  hs.window.filter.new(nil):subscribe(hs.window.filter.windowUnfocused, function () windowManager.unFocusedWindowEvent() end)

  -- ウィンドウ監視
  windowManager.windowWatcher = hs.timer.doEvery(windowManager.shinySpeed, windowManager.changeFocusedWindowEvent)
  windowManager.windowWatcher:start()

  -- スペース監視
  windowManager.spacesWatcher = hs.spaces.watcher.new(function() hs.timer.doAfter(0.5,function() windowManager.changeFocusedWindowEvent(true) end) end)
  windowManager.spacesWatcher:start()
end

-- フォーカス変更イベント
function windowManager.changeFocusedWindowEvent(lazyFlg)
  lazyFlg = lazyFlg or false
  windowManager.setNewFocusedWindowFlg()

  if lazyFlg then
    -- spaces移動などもっさりしたイベント様
    windowManager.newFocusedWindowFlg = true
  end

  windowManager.setFocusedWindow(hs.window.focusedWindow())
  windowManager.setTargetWindowCandidate(hs.window.filter.new():setCurrentSpace(true))

  if windowManager.getFocusedWindow() == nil then
    -- focusedWindow無し
    return
  end

  windowManager.borderShow()
end

-- フォーカス外れたイベント
function windowManager.unFocusedWindowEvent()
  windowManager.borderDelete()
end

-- フォーカス移動
function windowManager.focusWindow(directionKey)
  windowManager.changeFocusedWindowEvent()
  if windowManager.getTargetWindowCandidate() == nil then
      return
  end

  local tw = windowManager.getTargetWindowCandidate()
  tw['focusWindow' .. windowManager.direction[directionKey]](tw, nil, true, true)
end

-- ディスプレイ移動
function windowManager.moveDisplayWindow(directionKey)
  windowManager.changeFocusedWindowEvent()
  if windowManager.getFocusedWindow() == nil then
    return
  end

  if not windowManager.checkNextDisplay (directionKey) then
    return
  end

  local fw = windowManager.getFocusedWindow()
  fw['moveOneScreen' .. windowManager.direction[directionKey]](fw, true):maximize()
end

-- ウィンドウ移動
function windowManager.moveWindow(directionKey)
  windowManager.changeFocusedWindowEvent()
  if windowManager.getFocusedWindow() == nil then
    return
  end

  -- 移動前ウィンドウ
  local beforeWindowSize = windowManager.getFocusedWindowSize()

  -- ウィンドウ移動
  local max = windowManager.getFocusedWindow():screen():frame()
  local setFrame = windowManager['getWindow' .. directionKey](max)
  windowManager.getFocusedWindow():setFrame(setFrame)

  if directionKey == 'MAX' then
    -- 最大サイズ から 最大サイズ
    return
  end

  if windowManager.checkMoveWindow(beforeWindowSize) then
    return
  end

  windowManager.moveDisplayWindow(directionKey)
end
----------------------------------------------

-- get ------------------------------------------------
function windowManager.getFocusedWindow()
  return windowManager.focusedWindow
end

function windowManager.getTargetWindowCandidate()
  return windowManager.targetWindowCandidate
end

-- フォーカスがあるウィンドウのサイズ
function windowManager.getFocusedWindowSize()
  local size = {}
  local fw = windowManager.getFocusedWindow()

  size.x = fw:topLeft().x
  size.y = fw:topLeft().y
  size.w = fw:size().w
  size.h = fw:size().h
  return size
end

-- 枠線オブジェクト
function windowManager.getFocusedWindowBorder()
  return windowManager.borderObj
end

-- 枠線色
function windowManager.getBorderColor()
  local borderColor = {}
  for k, v in pairs(windowManager.borderColorKeys) do
    borderColor[v] = math.random(0, 1)
  end
  return borderColor
end

-- 枠線幅
function windowManager.getBorderWidth()
  if windowManager.newFocusedWindowFlg then
    return windowManager.newBorderWidth
  end
  return windowManager.normalBorderWidth
end

-- ウィンドウ移動用座標
function windowManager.getWindowL(max)
  local coordinate = {}
  coordinate.x = max.x
  coordinate.y = max.y
  coordinate.w = max.w / 2
  coordinate.h = max.h
  return coordinate
end

-- ウィンドウ移動用座標
function windowManager.getWindowR(max)
  local coordinate = {}
  coordinate.x = max.x + (max.w / 2)
  coordinate.y = max.y
  coordinate.w = max.w / 2
  coordinate.h = max.h
  return coordinate
end

-- ウィンドウ移動用座標
function windowManager.getWindowU(max)
  local coordinate = {}
  coordinate.x = max.x
  coordinate.y = max.y
  coordinate.w = max.w
  coordinate.h = max.h / 2
  return coordinate
end

-- ウィンドウ移動用座標
function windowManager.getWindowD(max)
  local coordinate = {}
  coordinate.x = max.x
  coordinate.y = max.y + (max.h / 2)
  coordinate.w = max.w
  coordinate.h = max.h / 2
  return coordinate
end

-- ウィンドウ移動用座標
function windowManager.getWindowMAX(max)
  local coordinate = {}
  coordinate.x = max.x
  coordinate.y = max.y
  coordinate.w = max.w
  coordinate.h = max.h
  return coordinate
end
------------------------------------------------------

-- set ------------------------------------------------
function windowManager.setFocusedWindow(focusedWindow)
  windowManager.focusedWindow = focusedWindow
end

function windowManager.setTargetWindowCandidate(targetWindowCandidate)
  windowManager.targetWindowCandidate = targetWindowCandidate
end
------------------------------------------------------

------------------------------------------------------
-- 枠線表示
function windowManager.borderShow()
  -- 前回表自分があれば削除
  windowManager.borderDelete()

  -- ウィンドウ情報無し
  if (hs.window.desktop() == windowManager.getFocusedWindow())then
    return false
  end

  -- 枠線作成
  windowManager.createFocusedWindowBorder()

  -- 枠線表示
  windowManager.getFocusedWindowBorder():show()
  return true
end

-- 枠線削除
function windowManager.borderDelete()
  if windowManager.getFocusedWindowBorder() then
    windowManager.getFocusedWindowBorder():delete()
    return true
  end
  return false
end

-- 枠線作成
function windowManager.createFocusedWindowBorder(borderObj)
  -- 枠線サイズ
  windowManager.borderObj = hs.drawing.rectangle(hs.geometry.rect(windowManager.getFocusedWindowSize()))
  -- 塗りつぶし無し
  windowManager.borderObj:setFill(false)
  -- 枠線幅
  windowManager.borderObj:setStrokeWidth(windowManager.getBorderWidth())
  windowManager.borderObj:setStrokeColor(windowManager.getBorderColor())
end

-- フォーカスが変更された
function windowManager.setNewFocusedWindowFlg()
  if hs.window.focusedWindow() == windowManager.getFocusedWindow() then
    windowManager.newFocusedWindowFlg = false
    return
  end
  windowManager.newFocusedWindowFlg = true
end

-- ウィンドウが移動したか
function windowManager.checkMoveWindow (baseWindowSize, checkWindowSize)
  checkWindowSize = checkWindowSize or windowManager.getFocusedWindowSize()

  for k, v in pairs(baseWindowSize) do
    if v ~= checkWindowSize[k] then
      return true
    end
  end

  return false
end

-- 次のディスプレイがあるか
function windowManager.checkNextDisplay (directionKey)
  local fw = windowManager.getFocusedWindow()
  if fw:screen()['to' .. windowManager.direction[directionKey]](fw:screen()) == nil then
    -- 移動先ディスプレイがない
    return false
  end
  return true
end
------------------------------------------------------

return windowManager
