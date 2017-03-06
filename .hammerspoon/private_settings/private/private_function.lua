local private_function = {}

-- フォーカス変更があった
private_function.focusLight = false

-- フォーカスウィンドウを明るく
function private_function.focusLightOn()
  DEFAULT_FUNCTION.shell(SETTING['event']['newFocusedWindowEventON'])
  private_function.focusLight = true
end

-- focusLightOnの取り消し
function private_function.focusLightOff()
  if private_function.focusLight then
    DEFAULT_FUNCTION.shell(SETTING['event']['newFocusedWindowEventOFF'])
  end
  private_function.focusLight = false
end

return private_function
