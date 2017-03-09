local setting = {}

--- public
--------------------------------------------------------------------------------
-- hs関連の設定
function setting.init()
  -- ウィンドウ移動アニメーション
  hs.window.animationDuration = 0
  -- 次のウィンドウがあるかのチェックの制度をあげる
  hs.screen.strictScreenInDirection = true
end

-- 設定情報リターン
function setting.getSetting()
  return {
    event = {
      newFocusedWindowEventON = [[ osascript -e 'tell application "HazeOver" to set intensity to 70' & ]],
      newFocusedWindowEventOFF = [[ osascript -e 'tell application "HazeOver" to set intensity to 0' & ]],
      -- 全て明るくするまでの時間
      newFocusedWindowEventOFFDoAfterTime = 0.5,
    },

    -- 効果音関連
    soundEffect = {
      -- 効果音ディレクトリ
      path = '~/Dropbox/developer/sound_effect/',

      -- 長押し対応
      kill = [['killall afplay > /dev/null 2>&1 &']],

      -- リロード時にthemeからランダムの場合は、'random'
      -- 自分で選びたい時は、themeの値をセット
      -- theme = 'Lupin_the_Third',
      -- theme = 'random',
      theme = 'mario',

      -- 効果音volume
      volume = '0.15'
    },

    -- イベント監視関連
    eventWatchManager = {
      -- ウィンドウ監視間隔
      watcherInterval = 0.1,
    },

    -- 描画関連
    drawing = {
      -- 枠線太さ
      normalBorderWidth = 4,

      -- 利用される色
      colors = {
        'red','blue','green'
      }
    },

    -- hs用設定
    hs = {
      -- 上下左右 と 東西南北 をマッピング
      direction = {
        U = 'North',
        D = 'South',
        L = 'West',
        R = 'East',
      }
    },

  }
end
--------------------------------------------------------------------------------
return setting
