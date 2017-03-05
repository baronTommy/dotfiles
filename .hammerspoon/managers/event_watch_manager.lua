local eventWatchManager = {}

-- 他のmanager
eventWatchManager.allManager = nil

-- cron
eventWatchManager.crone = nil

-- スペース監視
eventWatchManager.spacesWatcher = nil

-- キーダウン監視
eventWatchManager.HSKeyEventDownWatcher = nil

-- 枠線オブジェクト
eventWatchManager.drawingObject = nil

-- public
--------------------------------------------------------------------------------
function eventWatchManager.init(manager)
  eventWatchManager.allManager = manager

  eventWatchManager.crone = hs.timer.doEvery(SETTING['eventWatchManager']['watcherInterval'], eventWatchManager.crone)
  eventWatchManager.crone:start()

  -- eventWatchManager.spacesWatcher = hs.spaces.watcher.new(function() hs.timer.doAfter(eventWatchManager.spacesWatcherLazyTimeShinySpeed,function() eventWatchManager.spaces() end) end)
  -- eventWatchManager.spacesWatcher:start()

  eventWatchManager.HSKeyEventDownWatcher = hs.eventtap.new({hs.eventtap.event.types.keyDown},eventWatchManager.HSKeyEventDown)
  eventWatchManager.HSKeyEventDownWatcher:start()

  mouseManager.HSLeftMouseWatcher = hs.eventtap.new({hs.eventtap.event.types.leftMouseDown},mouseManager.HSmouseLClick)
  mouseManager.HSLeftMouseWatcher:start()

  mouseManager.HSRightMouseWatcher = hs.eventtap.new({hs.eventtap.event.types.rightMouseDown},mouseManager.HSmouseRClick)
  mouseManager.HSRightMouseWatcher:start()
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
end

-- キーダウン監視
function eventWatchManager.HSKeyEventDown (HSObj)
  EVENT.keyDown(HSObj)
end

-- 左クリック
function mouseManager.HSmouseLClick (HSObj)
  EVENT.mouseLClick(HSObj)
end

-- 右クリック
function mouseManager.HSmouseRClick (HSObj)
  EVENT.mouseRClick(HSObj)
end
--------------------------------------------------------------------------------

return eventWatchManager
