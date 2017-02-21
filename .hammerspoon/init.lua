--------------------------------------------------------------------------------
-- ウィンドウ移動アニメーション
hs.window.animationDuration = 0
-- 次のウィンドウがあるかのチェックの制度をあげる
hs.screen.strictScreenInDirection = true
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
DEFAULT_FUNCTION = require ('libraries/default_function')
SETTING = require ('settings/setting').getSetting()

SOUND_EFFECT = require ('libraries/sound_effect')
SOUND_EFFECT.init(SETTING['sound_effect'])
--------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------
require ('managers/window_manager').init()
require ('managers/keyboard_manager').init()
require ('managers/mouse_manager').init()
-- --------------------------------------------------------------------------------

SOUND_EFFECT.soundEffect('loadEnd')

-- todo

-- 効果音
-- imeが日本語時
-- タブ切り替え時
-- カーソルやエンター
-- 長時間連打のコンボ

-- ウィンドウ操作
-- ウィンドウループ移動

-- タブ変更やウィンドウ変更などの処理前 & 処理後に 処理を入れる
