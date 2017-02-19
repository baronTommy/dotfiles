local setting = {}

-- 設定情報リターン
function setting.getSetting()
  return {
      sound_effect = {
        -- 効果音ディレクトリ
        path = '~/dotfiles/soundEffect/',

        -- リロード時にthemeからランダムの場合は、true
        -- random = true
        -- 自分で選びたい時は、themeの値をセット
        theme = 'sword',
      },
  }
end

return setting
