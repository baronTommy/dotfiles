local soundEffectLibrary = {}

-- 効果音一覧
soundEffectLibrary.targetList = {}

-- kill 発動カウンタ
soundEffectLibrary.killCount = 0
soundEffectLibrary.killCountMax = 50

-- public
--------------------------------------------------------------------------------
function soundEffectLibrary.init()
  -- テーマセット
  if SETTING['soundEffect']['theme'] == 'random' then
    local key = math.random(1, #DEFAULT_FUNCTION.getLsTable(SETTING['soundEffect']['path']))
    for k,v in pairs(DEFAULT_FUNCTION.getLsTable(SETTING['soundEffect']['path'])) do
      if k == key then
        SETTING['soundEffect']['theme'] = v
      end
    end
  end

  -- 対象ディレクトリの効果音をtable化
  local path = SETTING['soundEffect']['path']..SETTING['soundEffect']['theme']..'/'
  for k,directory in pairs(DEFAULT_FUNCTION.getLsTable(path)) do
    table.insert(soundEffectLibrary.targetList, directory)
    soundEffectLibrary.targetList[directory] = {}
    for k,file in pairs(DEFAULT_FUNCTION.getLsTable(path..directory)) do
      table.insert(soundEffectLibrary.targetList[directory], file)
    end
  end

end


-- 効果音を鳴らす
function soundEffectLibrary.soundEffect(type)
  local soundFlg = false
  for k, v in pairs(soundEffectLibrary.targetList) do
    if k == type then
      soundFlg = true
      break
    end
  end

  if soundFlg == false then
    return
  end

  if #soundEffectLibrary.targetList[type] == 0 then
    return
  end

  soundEffectLibrary.killCount = soundEffectLibrary.killCount + 1
  if soundEffectLibrary.killCount > soundEffectLibrary.killCountMax then
    soundEffectLibrary.killCount = 0
    DEFAULT_FUNCTION.shell(SETTING['soundEffect']['kill'])
  end

  DEFAULT_FUNCTION.shell('afplay -v '..SETTING['soundEffect']['volume']..' '..SETTING['soundEffect']['path']..SETTING['soundEffect']['theme']..'/'..type..'/"'..soundEffectLibrary.targetList[type][math.random(1, #soundEffectLibrary.targetList[type])]..'" &')
end
--------------------------------------------------------------------------------

return soundEffectLibrary
