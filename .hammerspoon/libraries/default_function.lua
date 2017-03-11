local defaultFunction = {}

-- public
--------------------------------------------------------------------------------
-- 対象ディレクトリのファイル一覧取得
function defaultFunction.getLsTable(path)
  local fileNameList = {}
  local file = defaultFunction.shell("ls "..path)
  for fileName in file:lines() do
    table.insert(fileNameList, fileName)
  end
  file:close()
  return fileNameList
end

-- フォーカスがあるウィンドウのディスプレイサイズ
function defaultFunction.getDisplaySizeMAX(focusedWindow)
  return focusedWindow:screen():frame()
end

-- フォーカスがあるウィンドウのディスプレイサイズの 左半分
function defaultFunction.getDisplaySizeL(focusedWindow)
  local windowMax = defaultFunction.getDisplaySizeMAX(focusedWindow)
  return {
    windowMax.x,
    windowMax.y,
    windowMax.w / 2,
    windowMax.h,
  }
end

-- フォーカスがあるウィンドウのディスプレイサイズの 右半分
function defaultFunction.getDisplaySizeR(focusedWindow)
  local windowMax = defaultFunction.getDisplaySizeMAX(focusedWindow)
  return {
    windowMax.x + (windowMax.w / 2),
    windowMax.y,
    windowMax.w / 2,
    windowMax.h,
  }
end

-- フォーカスがあるウィンドウのディスプレイサイズの 上半分
function defaultFunction.getDisplaySizeU(focusedWindow)
  local windowMax = defaultFunction.getDisplaySizeMAX(focusedWindow)
  return {
    windowMax.x,
    windowMax.y,
    windowMax.w,
    windowMax.h / 2,
  }
end

-- フォーカスがあるウィンドウのディスプレイサイズ 下半分
function defaultFunction.getDisplaySizeD(focusedWindow)
  local windowMax = defaultFunction.getDisplaySizeMAX(focusedWindow)
  return {
    windowMax.x,
    windowMax.y + (windowMax.h / 2),
    windowMax.w,
    windowMax.h / 2,
  }
end

-- フォーカスがあるウィンドウ
function defaultFunction.getFocusedWindow()
  return hs.window.focusedWindow()
end

-- ウィンドウのサイズ
function defaultFunction.getWindowSize(window)
  window = window or defaultFunction.getFocusedWindow()
  if window == nil then
    return
  end
  return {
    window:topLeft().x,
    window:topLeft().y,
    window:size().w,
    window:size().h,
  }
end

-- 上下左右 を 東西南北 に変換
function defaultFunction.conversionDirection(key)
  return SETTING['hs']['direction'][key]
end

-- 移動先にディィスプレイがあるか
function defaultFunction.checkNextDisplay (directionKey)
  local fw = defaultFunction.getFocusedWindow()
  if fw:screen()['to' .. defaultFunction.conversionDirection(directionKey)](fw:screen()) == nil then
    -- 移動先ディスプレイがない
    return false
  end
  return true
end

-- ウィンドウが移動したか
function defaultFunction.checkMoveWindow (baseWindowSize)
  local checkWindowSize = defaultFunction.getWindowSize()
  for k, v in pairs(baseWindowSize) do
    if v ~= checkWindowSize[k] then
      return true
    end
  end
  -- 移動していない
  return false
end

-- 隣のディスプレイへ移動するか?
function defaultFunction.checkMoveDisplayWindow(directionKey, beforeWindowSize)
  if directionKey == 'MAX' then
    -- 最大サイズ から 最大サイズ
    return false
  end

  if defaultFunction.checkMoveWindow(beforeWindowSize) then
    -- 移動あり
    return false
  end

  return true
end

-- フォーカスが移動したか
function defaultFunction.checkfocusMove(directionKey, beforeFocusedWindow)
  if beforeFocusedWindow == defaultFunction.getFocusedWindow() then
    -- 移動無し
    return false
  end

  return true

end

-- コマンド実行
function defaultFunction.shell(command)
  return io.popen(command)
end
--------------------------------------------------------------------------------

return defaultFunction
