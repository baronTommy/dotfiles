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

-- imeが日本語時の効果音
-- タブ切り替え時の効果音
-- カーソルやエンターで効果音かえる

-- alt tab
-- http://www.hammerspoon.org/docs/hs.window.switcher.html
-- http://www.hammerspoon.org/docs/hs.expose.html

-- TextScrubのようなクリップボードに対しての正規表現
-- マウスジャンプ 左のキーでざっくり移動
-- alert でクリップボードとかの通知
-- HazeOverやめてdrawingでがんばる
-- 先ほどいたスペースに戻る

-- 移植
-- マウスジェスチャにも使えるかも
-- https://gist.github.com/kizzx2/e542fa74b80b7563045a

-- D&Dでフォーカス解除


-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
--   hs.reload()
-- end)
