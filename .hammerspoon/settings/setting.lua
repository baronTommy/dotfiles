local setting = {}

-- 設定情報リターン
function setting.getSetting()
  return {
      sound_effect = {
        -- 効果音ディレクトリ
        path = '~/dotfiles/sound_effect/',

        -- リロード時にthemeからランダムの場合は、'random'
        theme = 'random'

        -- 自分で選びたい時は、themeの値をセット
        -- theme = 'Lupin_the_Third',
      },
  }
end

return setting
