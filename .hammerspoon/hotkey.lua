hs.hotkey.bind({}, 'pad6', function()
  HS_H.focus:moveWindow({direction = 'left'})
end)

hs.hotkey.bind({}, 'pad7', function()
  HS_H.focus:moveWindow({direction = 'down'})
end)

hs.hotkey.bind({}, 'pad8', function()
  HS_H.focus:moveWindow({direction = 'up'})
end)

hs.hotkey.bind({}, 'pad9', function()
  HS_H.focus:moveWindow({direction = 'right'})
end)

----------------------------------------------------------------
hs.hotkey.bind({}, 'pad=', function()
  MY_HS_H.window:movePosition({position = 'left_half'})
end)

hs.hotkey.bind({}, 'pad.', function()
  MY_HS_H.window:movePosition({position = 'down_half'})
end)

hs.hotkey.bind({}, 'pad-', function()
  MY_HS_H.window:movePosition({position = 'up_half'})
end)

hs.hotkey.bind({}, 'pad/', function()
  MY_HS_H.window:movePosition({position = 'right_half'})
end)

hs.hotkey.bind({}, 'pad*', function()
  MY_HS_H.window:movePosition({position = 'max'})
end)

----------------------------------------------------------------
hs.hotkey.bind({'ctrl'}, 'pad0', function() hs.eventtap.keyStroke({'ctrl', 'shift', 'option', 'cmd'}, 'F') end)

hs.hotkey.bind({'ctrl'}, 'pad1', function() goToDeskTop(1) end)
hs.hotkey.bind({'ctrl'}, 'pad2', function() goToDeskTop(2) end)
hs.hotkey.bind({'ctrl'}, 'pad3', function() goToDeskTop(3) end)
hs.hotkey.bind({'ctrl'}, 'pad4', function() goToDeskTop(4) end)
hs.hotkey.bind({'ctrl'}, 'pad5', function() goToDeskTop(5) end)
hs.hotkey.bind({'ctrl'}, 'pad6', function() goToDeskTop(6) end)
hs.hotkey.bind({'ctrl'}, 'pad7', function() goToDeskTop(7) end)
hs.hotkey.bind({'ctrl'}, 'pad8', function() goToDeskTop(8) end)
hs.hotkey.bind({'ctrl'}, 'pad9', function() goToDeskTop(9) end)
hs.hotkey.bind({'ctrl'}, 'pad+', function() goToDeskTop(10) end)
hs.hotkey.bind({'ctrl'}, 'pad=', function() goToDeskTop(11) end)
hs.hotkey.bind({'ctrl'}, 'pad.', function() goToDeskTop(12) end)
hs.hotkey.bind({'ctrl'}, 'pad-', function() goToDeskTop(13) end)
hs.hotkey.bind({'ctrl'}, 'pad/', function() goToDeskTop(14) end)
hs.hotkey.bind({'ctrl'}, 'pad*', function() goToDeskTop(15) end)


----------------------------------------------------------------
hs.hotkey.bind({'option'}, 'pad1', function() sendToDeskTop(1) end)
hs.hotkey.bind({'option'}, 'pad2', function() sendToDeskTop(2) end)
hs.hotkey.bind({'option'}, 'pad3', function() sendToDeskTop(3) end)
hs.hotkey.bind({'option'}, 'pad4', function() sendToDeskTop(4) end)
hs.hotkey.bind({'option'}, 'pad5', function() sendToDeskTop(5) end)
hs.hotkey.bind({'option'}, 'pad6', function() sendToDeskTop(6) end)
hs.hotkey.bind({'option'}, 'pad7', function() sendToDeskTop(7) end)
hs.hotkey.bind({'option'}, 'pad8', function() sendToDeskTop(8) end)
hs.hotkey.bind({'option'}, 'pad9', function() sendToDeskTop(9) end)
hs.hotkey.bind({'option'}, 'pad+', function() sendToDeskTop(10) end)
hs.hotkey.bind({'option'}, 'pad=', function() sendToDeskTop(11) end)
hs.hotkey.bind({'option'}, 'pad.', function() sendToDeskTop(12) end)
hs.hotkey.bind({'option'}, 'pad-', function() sendToDeskTop(13) end)
hs.hotkey.bind({'option'}, 'pad/', function() sendToDeskTop(14) end)
hs.hotkey.bind({'option'}, 'pad*', function() sendToDeskTop(15) end)

function goToDeskTop(id)
  WINDOW_WATCHER:stop()
  HS_H.drawing:windowGridLineDelete()
  HS_H.desktop:moveDesktopTogether({desktop_id = id})
  WINDOW_WATCHER:start()
end

function sendToDeskTop(id)
  WINDOW_WATCHER:stop()
  HS_H.drawing:windowGridLineDelete()
  HS_H.desktop:moveWindowToOtherDesktop({desktop_id = id})
  HS_H.desktop:moveDesktopTogether({desktop_id = id})
  WINDOW_WATCHER:start()
end

-- local modMoveWindow = {'shift', 'cmd'}
-- local modMovePosition = {'shift', 'option'}
-- local modMoveDisplay = {'shift', 'ctrl'}

-- local directionKey = {'up', 'down', 'left', 'right'}
-- -- local directionKey = {'h', 'j', 'k', 'l'}
-- local positionName = {'up_half', 'down_half', 'left_half', 'right_half'}

-- for k, v in pairs(directionKey) do
--   hs.hotkey.bind(modMoveWindow, v, function()
--       HS_H.focus:moveWindow({direction = v})
--     end)
-- end

-- for k, v in pairs(directionKey) do
--   hs.hotkey.bind(modMovePosition, v, function()
--       MY_HS_H.window:movePosition({position = positionName[k]})
--     end)
-- end
-- hs.hotkey.bind(modMovePosition, 'M', function()
--     MY_HS_H.window:movePosition({position = 'max'})
--   end)

-- for k, v in pairs(directionKey) do
--   hs.hotkey.bind(modMoveDisplay, v, function()
--     MY_HS_H.window:moveDisplay({direction = directionKey[k]})
--     end)
-- end
