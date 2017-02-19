local keyboardManager = {}

-- キーボード監視
keyboardManager.HSKeyEventDownWatcher = nil

-- public ------------------------------------------------
function keyboardManager.init()
  -- ノーマルキー ダウン監視
  keyboardManager.HSKeyEventDownWatcher = hs.eventtap.new({hs.eventtap.event.types.keyDown},keyboardManager.HSKeyEventDown)
  keyboardManager.HSKeyEventDownWatcher:start()
end
--------------------------------------------------------

--------------------------------------------------------
-- HSキーダウン
function keyboardManager.HSKeyEventDown (HSObj)
  keyboardManager.soundEffect (HSObj)
end

function keyboardManager.soundEffect (HSObj)
  SOUND_EFFECT.soundEffect('keyDown')
end
--------------------------------------------------------

return keyboardManager
