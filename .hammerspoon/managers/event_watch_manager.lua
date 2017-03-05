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

  eventWatchManager.HSLeftMouseWatcher = hs.eventtap.new({hs.eventtap.event.types.leftMouseDown},eventWatchManager.HSmouseLClick)
  eventWatchManager.HSLeftMouseWatcher:start()

  eventWatchManager.HSRightMouseWatcher = hs.eventtap.new({hs.eventtap.event.types.rightMouseDown},eventWatchManager.HSmouseRClick)
  eventWatchManager.HSRightMouseWatcher:start()
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
function eventWatchManager.HSmouseLClick (HSObj)
  EVENT.mouseLClick(HSObj)
end

-- 右クリック
function eventWatchManager.HSmouseRClick (HSObj)
  EVENT.mouseRClick(HSObj)
end
--------------------------------------------------------------------------------

return eventWatchManager
