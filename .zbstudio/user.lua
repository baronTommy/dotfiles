--[[
https://github.com/pkulchenko/ZeroBraneStudio/blob/master/cfg/user-sample.lua
]]


-- font関連
editor.fontsize = 12
editor.fontname = "monoid"

-- カラースキーム
styles = loadfile('cfg/tomorrow.lua')('TomorrowNightBright')
stylesoutshell = styles

-- mac用 文字がぼやけない
hidpi = true
