local myEvent = {}

-- ユーザー設定
function myEvent.init()

end

-- フォーカス変更時
function myEvent.newFocusedWindowEvent()
  print('ok')
end

return myEvent
