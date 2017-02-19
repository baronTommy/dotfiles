local soundEffectLibrary = {}

-- 効果音パス
soundEffectLibrary.soundEffectPath = nil

-- 効果音テーマ
soundEffectLibrary.theme = nil

-- 効果音一覧
soundEffectLibrary.targetList = {}

function soundEffectLibrary.init(info)
  -- テーマ効果音ディレクトリ
  soundEffectLibrary.soundEffectPath = info['path']
  soundEffectLibrary.theme = info['theme']

  -- テーマセット
  if info['theme'] == 'random' then
    local key = math.random(1, #DEFAULT_FUNCTION.getLsTable(soundEffectLibrary.soundEffectPath))
    for k,v in pairs(DEFAULT_FUNCTION.getLsTable(soundEffectLibrary.soundEffectPath)) do
      if k == key then
        soundEffectLibrary.theme = v
      end
    end
  end

  -- 対象ディレクトリの効果音をtable化
  local path = soundEffectLibrary.soundEffectPath..soundEffectLibrary.theme..'/'
  for k,directory in pairs(DEFAULT_FUNCTION.getLsTable(path)) do
    table.insert(soundEffectLibrary.targetList, directory)
    soundEffectLibrary.targetList[directory] = {}
    for k,file in pairs(DEFAULT_FUNCTION.getLsTable(path..directory)) do
      table.insert(soundEffectLibrary.targetList[directory], file)
    end
  end

end

-- 効果音を慣らす
function soundEffectLibrary.soundEffect(type)
  local soundFlg = false
  for k, v in pairs(soundEffectLibrary.targetList) do
    if k == type then
      soundFlg = true
      break
    end
  end

  if soundFlg == false then
    return value
  end

  io.popen('afplay '..soundEffectLibrary.soundEffectPath..soundEffectLibrary.theme..'/'..type..'/'..soundEffectLibrary.targetList[type][math.random(1, #soundEffectLibrary.targetList[type])]..' & > /dev/null 2>&1 &')
end

return soundEffectLibrary
