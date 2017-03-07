local eventWatchManager = {}

-- public
--------------------------------------------------------------------------------
function eventWatchManager.init(manager)
  eventWatchManager.allManager = manager

  -- cron
  eventWatchManager.crone = hs.timer.doEvery(SETTING['eventWatchManager']['watcherInterval'], eventWatchManager.crone)
  eventWatchManager.crone:start()

  -- スペース
  eventWatchManager.spacesWatcher = hs.spaces.watcher.new( function() eventWatchManager.spaces() end)
  eventWatchManager.spacesWatcher:start()

  -- キーダウン
  eventWatchManager.HSKeyEventDownWatcher = hs.eventtap.new({hs.eventtap.event.types.keyDown},eventWatchManager.HSKeyEventDown)
  eventWatchManager.HSKeyEventDownWatcher:start()

  -- 左クリック
  eventWatchManager.HSLeftMouseWatcher = hs.eventtap.new({hs.eventtap.event.types.leftMouseDown},eventWatchManager.HSmouseLClick)
  eventWatchManager.HSLeftMouseWatcher:start()

  -- 右クリック
  eventWatchManager.HSRightMouseWatcher = hs.eventtap.new({hs.eventtap.event.types.rightMouseDown},eventWatchManager.HSmouseRClick)
  eventWatchManager.HSRightMouseWatcher:start()

  -- マウスムーブ
  eventWatchManager.HSMovedMouseWatcher = hs.eventtap.new({hs.eventtap.event.types.mouseMoved},eventWatchManager.HSMovedmouse)
  eventWatchManager.HSMovedMouseWatcher:start()
end
--------------------------------------------------------------------------------

-- private
--------------------------------------------------------------------------------
-- 定期処理
function eventWatchManager.crone()
  EVENT.crone(eventWatchManager.allManager.focusManager.updateFocusedWindow)
end

-- スペース監視
function eventWatchManager.spaces()
  EVENT.spaces()
end

-- キーダウン監視
function eventWatchManager.HSKeyEventDown (HSObj)
  EVENT.keyDown(HSObj)
end

-- 左クリック
function eventWatchManager.HSmouseLClick ()
  EVENT.mouseLClick()
end

-- 右クリック
function eventWatchManager.HSmouseRClick ()
  EVENT.mouseRClick()
end

-- マウスムーブ
function eventWatchManager.HSMovedmouse ()
  EVENT.movedMouse()
end
--------------------------------------------------------------------------------

return eventWatchManager
