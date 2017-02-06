-- ウィンドウ移動アニメーション
hs.window.animationDuration = 0

local main = {}
main.windowManager = require ('library/window_manager')
main.windowManager.init()

main.mouseManager = require ('library/mouse_manager')
main.mouseManager.init()


-- urlevent

-- フォーカス移動
hs.urlevent.bind("focusWindow", function(eventName, params)
  main.windowManager.focusWindow(params["directionKey"])
end)

-- ウィンドウ移動
hs.urlevent.bind("moveWindow", function(eventName, params)
  main.windowManager.moveWindow(params["directionKey"])
end)

-- ディスプレイ移動
hs.urlevent.bind("moveDisplayWindow", function(eventName, params)
  main.windowManager.moveDisplayWindow(params["directionKey"])
end)
