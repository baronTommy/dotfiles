local defaultFunction = {}

-- 対象ディレクトリのファイル一覧取得
function defaultFunction.getLsTable(path)
  local fileNameList = {}
  local file = io.popen("ls "..path)
  for fileName in file:lines() do
    table.insert(fileNameList, fileName)
  end
  file:close()
  return fileNameList
end

return defaultFunction
