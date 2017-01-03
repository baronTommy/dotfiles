-- ウィンドウ移動アニメーション
hs.window.animationDuration = 0

local main = {}
main.windowManager = require ('library/window_manager')
main.windowManager.init()


--------------------------------------------------------------------
-- function main.windowUnfocused()
--   main.windowManager.borderDelete()
-- end
-- main.windows:subscribe(hs.window.filter.windowUnfocused, function () main.windowUnfocused() end)

-- todo
-- urlevent
-- hs.urlevent.bind('test1', function() main.windowManager.focusWindowLeft() end)
-- <vkopenurldef>
-- <name>KeyCode::VK_OPEN_URL_SHELL.totalspaces2_go_q</name>
-- <url>hammerspoon://test1</url>
-- <background/>
-- </vkopenurldef>

-- -- フォーカス移動
-- hs.hotkey.bind({'cmd', 'alt', 'shift'}, 's', function() main.windowManager.focusWindow('L') end)
-- hs.hotkey.bind({'cmd', 'alt', 'shift'}, 'f', function() main.windowManager.focusWindow('R') end)
-- hs.hotkey.bind({'cmd', 'alt', 'shift'}, 'e', function() main.windowManager.focusWindow('U') end)
-- hs.hotkey.bind({'cmd', 'alt', 'shift'}, 'd', function() main.windowManager.focusWindow('D') end)

-- -- ウィンドウ移動
-- hs.hotkey.bind({'cmd', 'alt', 'shift'}, 's', function() main.windowManager.moveWindow('L') end)
-- hs.hotkey.bind({'cmd', 'alt', 'shift'}, 'f', function() main.windowManager.moveWindow('R') end)
-- hs.hotkey.bind({'cmd', 'alt', 'shift'}, 'e', function() main.windowManager.moveWindow('U') end)
-- hs.hotkey.bind({'cmd', 'alt', 'shift'}, 'd', function() main.windowManager.moveWindow('D') end)
-- hs.hotkey.bind({'cmd', 'alt', 'shift'}, 'c', function() main.windowManager.moveWindow('MAX') end)

-- -- ディスプレイ移動
-- hs.hotkey.bind({'cmd', 'alt', 'shift'}, 's', function() main.windowManager.moveDisplayWindow('L') end)
-- hs.hotkey.bind({'cmd', 'alt', 'shift'}, 'f', function() main.windowManager.moveDisplayWindow('R') end)
-- hs.hotkey.bind({'cmd', 'alt', 'shift'}, 'e', function() main.windowManager.moveDisplayWindow('U') end)
-- hs.hotkey.bind({'cmd', 'alt', 'shift'}, 'd', function() main.windowManager.moveDisplayWindow('D') end)
