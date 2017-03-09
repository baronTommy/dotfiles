local focusManager = {}

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
  focusManager.setPreviousFocusedWindow(focusedWindow)
end
--------------------------------------------------------------------------------

-- private
--------------------------------------------------------------------------------
function focusManager.setPreviousFocusedWindow(previousFocusedWindow)
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

return focusManager
