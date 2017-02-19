local mouseManager = {}

-- マウス監視
mouseManager.HSLeftMouseWatcher = nil
mouseManager.HSRightMouseWatcher = nil
mouseManager.HSOtherMouseWatcher = nil

-- public ------------------------------------------------
function mouseManager.init()
  mouseManager.HSLeftMouseWatcher = hs.eventtap.new({hs.eventtap.event.types.leftMouseDown},mouseManager.HSmouseClick)
  mouseManager.HSLeftMouseWatcher:start()

  mouseManager.HSRightMouseWatcher = hs.eventtap.new({hs.eventtap.event.types.rightMouseDown},mouseManager.HSmouseClick)
  mouseManager.HSRightMouseWatcher:start()
end
--------------------------------------------------------

--------------------------------------------------------
-- HSマウスダウン
function mouseManager.HSmouseClick (HSObj)
  mouseManager.soundEffect (HSObj)
end

function mouseManager.soundEffect (HSObj)
  SOUND_EFFECT.soundEffect('mouse')
end
--------------------------------------------------------

return mouseManager
