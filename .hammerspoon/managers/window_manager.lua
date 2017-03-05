local windowManager = {}

-- public
--------------------------------------------------------------------------------
-- ウィンドウ移動
function windowManager.moveWindow(directionKey)
  local focusedWindow = DEFAULT_FUNCTION.getFocusedWindow()

  if focusedWindow == nil then
    return
  end

  -- 移動前ウィンドウ サイズ (位置)
  local beforeWindowSize = DEFAULT_FUNCTION.getWindowSize()

  -- ウィンドウ移動
  focusedWindow:setFrame(DEFAULT_FUNCTION['getDisplaySize' .. directionKey](focusedWindow))

  if DEFAULT_FUNCTION.checkMoveDisplayWindow(directionKey, beforeWindowSize) then
    -- directionKey方向のディスプレイに移動
    windowManager.moveDisplayWindow(directionKey)
  end
end

-- ウィンドウを別のディスプレイへ移動
function windowManager.moveDisplayWindow(directionKey)
  local focusedWindow = DEFAULT_FUNCTION.getFocusedWindow()

  if focusedWindow == nil then
    return
  end

  if not DEFAULT_FUNCTION.checkNextDisplay (directionKey) then
    return
  end

  focusedWindow['moveOneScreen' .. DEFAULT_FUNCTION.conversionDirection(directionKey)](focusedWindow, true):maximize()
end
--------------------------------------------------------------------------------

return windowManager
