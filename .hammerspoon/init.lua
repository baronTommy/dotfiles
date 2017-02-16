-- ウィンドウ移動アニメーション
hs.window.animationDuration = 0
-- 次のウィンドウがあるかのチェックの制度をあげる
hs.screen.strictScreenInDirection = true

local main = {}
main.windowManager = require ('library/window_manager')
main.windowManager.init()

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





function main.hoge()
  io.popen('afplay ~/Dropbox/BGM/typewriter/Lupin_the_Third/type0'..math.random(1, 9)..'.mp3')
end
aaa = hs.eventtap.new({hs.eventtap.event.types.keyDown},main.hoge)
aaa:start()
