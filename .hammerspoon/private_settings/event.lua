local event = {}

-- ユーザー設定
function event.init()
  AA = require('private_settings/private/aa').getData()
end

-- 定期処理
function event.crone(newFocusedWindowListener)
  -- 新規フォーカスチェック用
  newFocusedWindowListener()
  DRAWING.updateDrawing()
end

-- フォーカス変更時
function event.newFocusedWindow()
  DEFAULT_FUNCTION.shell(SETTING['event']['newFocusedWindowEventON'])

  hs.timer.doAfter(0.2,function()
    DEFAULT_FUNCTION.shell(SETTING['event']['newFocusedWindowEventOFF'])
  end)
end

-- キーダウン
function event.keyDown(HSObj)
  SOUND_EFFECT.soundEffect('keyDown')
end

-- 左クリック
function event.mouseLClick(HSObj)
  SOUND_EFFECT.soundEffect('mouse')
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

return event
