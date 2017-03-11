local privateFunction = {}

-- コイン数える
privateFunction.oneUpCount = 0
privateFunction.oneUpCoin = 10

-- フォーカス変更があった
privateFunction.focusLight = false

-- フォーカスウィンドウを明るく
function privateFunction.focusLightOn()
  DEFAULT_FUNCTION.shell(SETTING['event']['newFocusedWindowEventON'])
  privateFunction.focusLight = true
end

-- focusLightOnの取り消し
function privateFunction.focusLightOff()
  if privateFunction.focusLight then
    DEFAULT_FUNCTION.shell(SETTING['event']['newFocusedWindowEventOFF'])
  end
  privateFunction.focusLight = false
end

-- キーダウン効果音
function privateFunction.keyDown(HSObj)
  return 'key_down'
end

-- キーダウン効果音
function privateFunction.keyDownRare()
  if math.random(1,10) == 10 then
    privateFunction.oneUpCount = privateFunction.oneUpCount + 1
    return 'key_down_rare'
  end
  return ''
end

-- 1up
function privateFunction.checkOneUp()
  if privateFunction.oneUpCount == privateFunction.oneUpCoin then
    privateFunction.oneUpCount = 0
    return '1up'
  end
end

return privateFunction
