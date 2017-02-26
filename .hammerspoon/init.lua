-- setting
--------------------------------------------------------------------------------
require ('settings/setting').init()
--------------------------------------------------------------------------------

-- global function
--------------------------------------------------------------------------------
SETTING = require ('settings/setting').getSetting()
DEFAULT_FUNCTION = require ('libraries/default_function')
SOUND_EFFECT = require ('libraries/sound_effect')
--------------------------------------------------------------------------------

-- global function init
--------------------------------------------------------------------------------
SOUND_EFFECT.init(SETTING['soundEffect'])
--------------------------------------------------------------------------------

-- 機能をロード
--------------------------------------------------------------------------------
require ('managers/window_manager').init(SETTING['windowManager'])
require ('managers/keyboard_manager').init()
require ('managers/mouse_manager').init()
--------------------------------------------------------------------------------

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
-- TextScrubのようなクリップボードに対しての正規表現
