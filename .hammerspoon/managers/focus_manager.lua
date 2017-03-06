local focusManager = {}

-- -- 現在フォーカスがあるウィンドウ
-- focusManager.focusedWindow = nil
--
-- -- フォーカスウィンドウサイズ
-- focusManager.focusedWindowSize = {}
--
-- -- 枠線の色のキー名
-- focusManager.drawingColorKeys = {
--   'red','blue','green'
-- }
--
-- -- 枠線オブジェクト
-- focusManager.drawingObject = nil
--
-- -- ウィンドウフォーカスが変更された
-- focusManager.newFocusedWindowFlg = nil
--
-- -- ウィンドウ監視
-- focusManager.windowWatcher = nil
--
-- -- スペース監視
-- focusManager.spacesWatcher = nil
--
-- -- スペース復帰
-- focusManager.spacesWatcherLazyTimeShinySpeed = 0.5
--
-- -- ウィンドウ監視間隔
-- focusManager.watcherInterval = nil



--------------------------------------------------------------------------------
--- ここからした
-- 一つ前の フォーカスウィンドウ
focusManager.previousFocusedWindow = nil

-- public
--------------------------------------------------------------------------------
-- フォーカス移動
function focusManager.focusWindow(directionKey)
  local beforeFocusedWindow = DEFAULT_FUNCTION.getFocusedWindow()
  if beforeFocusedWindow == nil then
    return
  end
  beforeFocusedWindow['focusWindow' .. DEFAULT_FUNCTION.conversionDirection(directionKey)](beforeFocusedWindow, nil, true, true)

  if DEFAULT_FUNCTION.checkfocusMove(directionKey, beforeFocusedWindow) then
  end
end

-- フォーカスウィンドウ変更処理
function focusManager.updateFocusedWindow()
  local focusedWindow =  DEFAULT_FUNCTION.getFocusedWindow()
  local newFocusedWindowFlg = true

  if focusManager.getpreviousFocusedWindow() == focusedWindow then
    -- 前と同じ
    newFocusedWindowFlg = false
  end

  if focusedWindow == nil then
    -- 対象無し
    newFocusedWindowFlg = false
  end

  if newFocusedWindowFlg then
    focusManager.newFocusedWindowEvent()
  end
  focusManager.setpreviousFocusedWindow(focusedWindow)
end
--------------------------------------------------------------------------------

-- private
--------------------------------------------------------------------------------
function focusManager.setpreviousFocusedWindow(previousFocusedWindow)
  focusManager.previousFocusedWindow = previousFocusedWindow
end

function focusManager.getpreviousFocusedWindow()
  return focusManager.previousFocusedWindow
end

-- フォーカスが変わった
function focusManager.newFocusedWindowEvent()
  EVENT.newFocusedWindow()
end
--------------------------------------------------------------------------------

-- function focusManager.init(settng)
--   -- focusManager.watcherInterval = settng['watcherInterval']
--   --
--   -- -- フォーカスが外れた場合
--   -- hs.window.filter.new(nil):subscribe(hs.window.filter.windowUnfocused, function () focusManager.unFocusedWindowEvent() end)
--   --
--   -- -- ウィンドウ監視
--   -- focusManager.windowWatcher = hs.timer.doEvery(focusManager.watcherInterval, focusManager.changeFocusedWindowEvent)
--   -- focusManager.windowWatcher:start()
--   --
--   -- -- スペース監視
--   -- focusManager.spacesWatcher = hs.spaces.watcher.new(function() hs.timer.doAfter(focusManager.spacesWatcherLazyTimeShinySpeed,function() focusManager.changeFocusedWindowEvent(true) end) end)
--   -- focusManager.spacesWatcher:start()
-- end


-- private
--------------------------------------------------------------------------------
-- -- フォーカス変更イベント
-- function focusManager.changeFocusedWindowEvent(lazyFlg)
--   lazyFlg = lazyFlg or false
--   focusManager.setNewFocusedWindowFlg()
--
--   if lazyFlg then
--     -- spaces移動などもっさりしたイベント様
--     focusManager.newFocusedWindowFlg = true
--   end
--
--   if focusManager.newFocusedWindowFlg then
--     SOUND_EFFECT.soundEffect('focusedWindowChange')
--   end
--
--   focusManager.setFocusedWindow(hs.window.focusedWindow())
--
--   if focusManager.getFocusedWindow() == nil then
--     -- focusedWindow無し
--     return
--   end
--
--   focusManager.drawingShow()
-- end
--
-- -- フォーカス外れたイベント
-- function focusManager.unFocusedWindowEvent()
--   focusManager.borderDelete()
-- end
--
-- -- フォーカスが変更された
-- function focusManager.setNewFocusedWindowFlg()
--   if hs.window.focusedWindow() == focusManager.getFocusedWindow() then
--     focusManager.newFocusedWindowFlg = false
--     return
--   end
--   focusManager.newFocusedWindowFlg = true
-- end
--
-- -- フォーカスがあるウィンドウ
-- function focusManager.getFocusedWindow()
--   return focusManager.focusedWindow
-- end
--------------------------------------------------------------------------------

--
-- --------------------------------------------------------------------------------
-- -- 枠線色
-- function focusManager.getBorderColor()
--   local borderColor = {}
--   for k, v in pairs(focusManager.drawingColorKeys) do
--     borderColor[v] = math.random(0, 1)
--   end
--   return borderColor
-- end
--
-- -- 枠線幅
-- function focusManager.getBorderWidth()
--   return SETTING['drawing']['normalBorderWidth']
-- end
--
-- -- フォーカスウィンドウをセット
-- function focusManager.setFocusedWindow(focusedWindow)
--   focusManager.focusedWindow = focusedWindow
-- end
--
-- -- 枠線オブジェクト作成
-- function createFocusedWindowBorder(size, width, color, fill)
--   return DRAWING.createDrawngObject(
--     size,
--     width,
--     color,
--     fill
--   )
-- end

-- -- 枠線表示
-- function focusManager.drawingShow()
--   -- 前回表自分があれば削除
--   focusManager.borderDelete()
--
--   -- ウィンドウ情報無し
--   if (hs.window.desktop() == focusManager.getFocusedWindow())then
--     return false
--   end
--
--   -- 枠線作成
--   focusManager.drawingObject = createFocusedWindowBorder(
--     DEFAULT_FUNCTION.getWindowSize(),
--     focusManager.getBorderWidth(),
--     focusManager.getBorderColor(),
--     false
--   )
--   -- 枠線表示
--   DRAWING.show(focusManager.drawingObject)
-- end
--
-- -- 枠線削除
-- function focusManager.borderDelete()
--   return DRAWING.delete(focusManager.drawingObject)
-- end
--
--
-- --------------------------------------------------------------------------------
return focusManager
