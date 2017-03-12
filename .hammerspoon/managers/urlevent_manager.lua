local urleventManager = {}

-- public
--------------------------------------------------------------------------------
function urleventManager.init(init)
  -- フォーカス移動
  hs.urlevent.bind("focusWindow", function(eventName, params)
      init.focusManager.focusWindow(params["directionKey"])
    end)

  -- ウィンドウ移動
  hs.urlevent.bind("moveWindow", function(eventName, params)
      init.windowManager.moveWindow(params["directionKey"])
    end)

  -- ディスプレイ移動
  hs.urlevent.bind("moveDisplayWindow", function(eventName, params)
      init.windowManager.moveDisplayWindow(params["directionKey"])
      EVENT.moveDisplayWindow()
    end)
end
--------------------------------------------------------------------------------

return urleventManager
