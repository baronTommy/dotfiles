local init = {}

-- setting load
--------------------------------------------------------------------------------
init.setting = require('private_settings/setting')
init.setting.init()
--------------------------------------------------------------------------------

-- global
--------------------------------------------------------------------------------
SETTING = init.setting.getSetting()

DEFAULT_FUNCTION = require('libraries/default_function')

SOUND_EFFECT = require('libraries/sound_effect')
SOUND_EFFECT.init()

DRAWING = require('libraries/drawing')

EVENT = require('private_settings/event')
EVENT.init()
--------------------------------------------------------------------------------

-- 機能をロード
--------------------------------------------------------------------------------
init.windowManager = require('managers/window_manager')
init.focusManager = require('managers/focus_manager')
--------------------------------------------------------------------------------

-- 他のmanagerに依存
------------------------------------------------------------------------------
require('managers/event_watch_manager').init(init)
require('managers/urlevent_manager').init(init)
------------------------------------------------------------------------------

-- loadEnd
------------------------------------------------------------------------------
EVENT.loadEnd()
------------------------------------------------------------------------------

-- todo

-- focusManager コメント削除
-- スペース監視

-- 効果音
-- imeが日本語時
-- タブ切り替え時
-- カーソルやエンター
-- 長時間連打のコンボ

-- alt tab
-- http://www.hammerspoon.org/docs/hs.window.switcher.html
-- http://www.hammerspoon.org/docs/hs.expose.html

-- タブ変更やウィンドウ変更などの処理前 & 処理後に 処理を入れる
-- TextScrubのようなクリップボードに対しての正規表現

-- マウスジャンプ 左のキーでざっくり
-- alert でクリップボードとかの通知
