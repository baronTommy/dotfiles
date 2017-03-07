local event = {}

-- ユーザー設定
function event.init()
  AA = require('private_settings/private/aa').getData()
  privateFunction = require('private_settings/private/private_function')
end

-- 定期処理
function event.crone(newFocusedWindowListener)
  -- 新規フォーカスチェック用
  newFocusedWindowListener()

  if (hs.window.desktop() ~= DEFAULT_FUNCTION.getFocusedWindow())then
    DRAWING.updateDrawing()
  end
end

-- スペース監視
function event.spaces()
end

-- フォーカスチェンジ無し
function event.noChangeFocus()
end

-- キーダウン
function event.keyDown(HSObj)
  SOUND_EFFECT.soundEffect('keyDown')
  privateFunction.focusLightOff()
end

-- 左クリック
function event.mouseLClick(HSObj)
  SOUND_EFFECT.soundEffect('mouse')
  privateFunction.focusLightOff()
end

-- 右クリック
function event.mouseRClick(HSObj)
  SOUND_EFFECT.soundEffect('mouse')
end

-- ロード完了
function event.loadEnd()
  SOUND_EFFECT.soundEffect('loadEnd')
  hs.alert.show(AA['loadEnd'])
end

-- フォーカス変更時
function event.newFocusedWindow()
  privateFunction.focusLightOn()
end

-- マウスムーブ時
function event.movedMouse()
  privateFunction.focusLightOff()
end

return event
