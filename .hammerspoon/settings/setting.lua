local setting = {}

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
      soundEffect = {
        -- 効果音ディレクトリ
        path = '~/dotfiles/.hammerspoon/sound_effect/',

        -- リロード時にthemeからランダムの場合は、'random'
        -- 自分で選びたい時は、themeの値をセット
        -- theme = 'Lupin_the_Third',
        theme = 'random',

        -- 効果音volume
        volume = '0.15'
      },

      windowManager = {
        -- 枠線太さ 通常
        normalBorderWidth = 4,

        -- 枠線太さ フォーカス変更時
        newBorderWidth = 200,

        -- ピカピカ
        shinySpeed = 0.1,
      },
  }
end

return setting
