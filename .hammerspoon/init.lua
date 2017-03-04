local init = {}

-- setting
--------------------------------------------------------------------------------
init.setting = require('settings/setting')
init.setting.init()
--------------------------------------------------------------------------------

-- global function
--------------------------------------------------------------------------------
SETTING = init.setting.getSetting()
DEFAULT_FUNCTION = require('libraries/default_function')
SOUND_EFFECT = require('libraries/sound_effect')
--------------------------------------------------------------------------------

-- global function init
--------------------------------------------------------------------------------
SOUND_EFFECT.init(SETTING['soundEffect'])
--------------------------------------------------------------------------------

-- 機能をロード
--------------------------------------------------------------------------------
init.windowManager = require('managers/window_manager')
init.windowManager.init(SETTING['windowManager'])
require('managers/keyboard_manager').init()
require('managers/mouse_manager').init()
--------------------------------------------------------------------------------

-- urlevent
------------------------------------------------------------------------------
-- フォーカス移動
hs.urlevent.bind("focusWindow", function(eventName, params)
    init.windowManager.focusWindow(params["directionKey"])
  end)

-- ウィンドウ移動
hs.urlevent.bind("moveWindow", function(eventName, params)
    init.windowManager.moveWindow(params["directionKey"])
  end)

-- ディスプレイ移動
hs.urlevent.bind("moveDisplayWindow", function(eventName, params)
    init.windowManager.moveDisplayWindow(params["directionKey"])
  end)
------------------------------------------------------------------------------

------------------------------------------------------------------------------
SOUND_EFFECT.soundEffect('loadEnd')

s = [[

私のスピードに
　-= ∧＿∧
-=と(´･ω･`)　ｼｭﾀｯ
　-=/　と_ノ
-=_/／⌒ｿ

ついてこれるかな？
∧＿∧ =-
(´･ω･`)`つ=-　ｻﾞｻﾞｯ
　`つ \ =-
　\,⌒＼\,,,_=-

]]
hs.alert.show(s)
------------------------------------------------------------------------------

-- todo

-- 効果音
-- imeが日本語時
-- タブ切り替え時
-- カーソルやエンター
-- 長時間連打のコンボ

-- ウィンドウ操作
-- ウィンドウループ移動

-- タブ変更やウィンドウ変更などの処理前 & 処理後に 処理を入れる
-- TextScrubのようなクリップボードに対しての正規表現

-- マウスジャンプ 左のキーでざっくり
