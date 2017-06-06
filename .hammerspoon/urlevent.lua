hs.urlevent.bind('move_focus', function(eventName, parameter)
    HS_H.focus:moveWindow(parameter)
  end)

hs.urlevent.bind('move_window_position', function(eventName, parameter)
    MY_HS_H.window:movePosition(parameter)
  end)

hs.urlevent.bind('move_window_position_to_other_display', function(eventName, parameter)
    MY_HS_H.window:moveDisplay(parameter)
  end)

hs.urlevent.bind('move_desktop_together', function(eventName, parameter)
    HS_H.drawing:windowGridLineDelete()
    WINDOW_WATCHER:stop()
    HS_H.desktop:moveDesktopTogether(parameter)
    WINDOW_WATCHER:start()
  end)

hs.urlevent.bind('move_window_to_other_desktop', function(eventName, parameter)

    local function sleepOne()
      local start = os.time()
      while os.time() - start < 0.3 do end
    end


    windowPPP = hs.window.focusedWindow()

    -- 指定のdisplay位置に戻す
    local position = {
      windowPPP:topLeft().x,
      windowPPP:topLeft().y,
      windowPPP:size().w,
      windowPPP:size().h
    }

    HS_H.desktop:moveWindowToOtherDesktop(parameter)
    sleepOne()

    -- 必須
    HS_H.desktop:moveDesktopTogether(parameter)

    sleepOne()
    windowPPP:setFrame(position)


P(D(position))

    -- WINDOW_WATCHER:stop()
    -- HS_H.desktop:moveWindowToOtherDesktop(parameter)

    -- local aa = HS_H.desktop:moveDesktopTogether(parameter)
    --
    -- if aa.isValid and aa.isExec then
    --
    --   local function sleepOne()
    --     local start = os.time()
    --     while os.time() - start < 0.5 do end
    --   end
    --   sleepOne()
    --   for k,v in pairs(hs.window.allWindows()) do
    --     if v:id() == targetWindow:id() then
    --       hs.window.focus(v)
    --       MY_HS_H.window:moveDisplay({direction = "right"})
    --       break
    --     end
    --   end
    --
    --
    -- end


    WINDOW_WATCHER:start()
  end)


hs.urlevent.bind('xxx', function(eventName, parameter)
    -- アクティブウィンドウがあるデスクトップ移動
    ------------------------------------------------
    -- local goToDesktopId = parameter.desktop_id
    --
    --
    --
    -- local targetDisplayId = nil
    --
    --
    -- if ACTIVE_DISPLAYID then
    -- BEFORE_ACTIVE_DISPLAYID = ACTIVE_DISPLAYID
    -- end
    --
    -- ACTIVE_DISPLAYID = HS_H.api:call({call = 'get_display_id'}).apiResult
    --
    -- targetDisplayId = ACTIVE_DISPLAYID
    -- if targetDisplayId == nil then
    -- targetDisplayId = BEFORE_ACTIVE_DISPLAYID
    -- end
    --
    --
    --
    --
    --
    --
    --
    -- local command=[=[\
    -- ruby -r totalspaces2 \
    -- -e 'TotalSpaces2.move_to_space_on_display('$desktopId', '$displayId')'
    -- ]=]
    --
    -- local replace = {
    -- desktopId = goToDesktopId ,
    -- displayId = targetDisplayId ,
    -- }
    --
    -- local x = command:gsub('$(%w+)', replace)
    -- P(x)
    -- io.popen(x)
    --
    ------------------------------------------------

  end)
