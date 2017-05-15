-- http://qiita.com/saddy575/items/8914a0b030ac62c26791
local function dump_data( data )
  if type( data ) ~= "table" then
    return tostring(data) ;
  end;

  dump_table = function( t, indent )
    local str = "{\n";
    for k, v in pairs( t ) do
      if type( v ) == "table" then
        str = string.format("%s%s%s%s = %s,\n", str, indent, "\t", tostring( k ),dump_table( v, indent .. "\t" ) );
      elseif type( v ) == "string" then
        str = string.format("%s%s%s%s = %q,\n", str, indent, "\t", tostring( k ), v );
      else
        str = string.format("%s%s%s%s = %s,\n", str, indent, "\t", tostring( k ), tostring( v ) );
      end;
    end;
    str = str .. indent .. "}";
    return str;
  end;

  return dump_table( data, "" );
end
D = dump_data
P = print
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
hs.window.animationDuration = 0
hs.screen.strictScreenInDirection = true
hs.hotkey.bind({"cmd",'shift'}, "R", function()
    hs.reload()
  end)

local boot = require('hammerspoon_helper/boot/init').new()
boot:init()
HS_H = boot:commandActivation('All')
MY_HS_H = boot:usrCommandActivation('All')

require('./urlevent')

local cron = require('./cron').new()
cron:init()
COROUTINE = {}
COROUTINE.CREATE_RANDOM_COLOR = coroutine.create(cron.createRandomColor)

WINDOW_WATCHER = hs.timer.doEvery(cron.frequency, cron.windowWatcher)
WINDOW_WATCHER:start()

hs.alert('load end')

-- todo
--------------- --------------- --------------- ---------------
-- D&Dの時振動やめる



-- totalspaces
-- 振動はtotalspacesの時はしない
-- kwm
-- 振動の強弱はウィンドウサイズに応じて
-- imeが日本語時の効果音
-- タブ切り替え時の効果音
-- カーソルやエンターで効果音かえる

-- フォーカスが無い場合のオートフォーカス

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

-- totalspeaces後 focusが無い場合 なにかにあわせる
-- コルーチンを利用してマウスの周りにわっか
-- ステータスライン
--------------- --------------- --------------- ---------------

--------------- --------------- --------------- ---------------
-- function globalFunction.requires(path)
-- globalFunction.loadFileNameList(path)
-- end
--
-- function globalFunction.loadFileNameList(path)
-- local command = [[
-- for i in `find path -name "*.lua"`; do echo ${i%} | sed -e "s/.lua$//" | sed -e "s/.*\///"; done
-- ]]
-- local delimiter = ('([^%s]+)'):format('\n')
-- local result = lib.f.execCommand(string.gsub(command, 'path', path))
--
-- local resultTable = {}
-- for fileName in result:gmatch(delimiter) do
-- table.insert(resultTable, fileName)
-- end
--
-- return resultTable
-- end
--
-- function globalFunction.execCommand(command)
-- local handle = io.popen(command)
-- local result = handle:read('*a')
-- handle:close()
--
-- return result
-- end

-- hs.execute
-- function this.execCommand(command)
-- local handle = io.popen(command)
-- local result = handle:read('*a')
-- handle:close()
--
-- return result
-- end
--------------- --------------- --------------- ---------------

-- function c1()
-- while true do
-- print("c1" .. p)
-- coroutine.yield()
-- end
-- end
--
-- fc1 = c1
-- co1 = coroutine.create(fc1)
--
-- p = 'xx'
-- coroutine.resume(co1)
--
-- p = 'zz'
-- coroutine.resume(co1)
