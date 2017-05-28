hs.urlevent.bind('move_focus', function(eventName, parameter)
    HS_H.focus:moveWindow(parameter)
  end)

hs.urlevent.bind('move_window_position', function(eventName, parameter)
    MY_HS_H.window:movePosition(parameter)
  end)

hs.urlevent.bind('move_window_position_to_other_display', function(eventName, parameter)
    MY_HS_H.window:moveDisplay(parameter)
  end)

hs.urlevent.bind('sync_move_desktop', function(eventName, parameter)
    -- ウィンドウ移動
    ------------------------------------------------
    P(HS_H.api:call({call = 'get_display_id'}).apiResult)

    ------------------------------------------------


    -- 全部のデスクトップ移動
    ------------------------------------------------
    -- local goToDesktopId = parameter.desktop_id
    --
    -- local commandModel = [[\
    -- ruby -r totalspaces2 \
    -- -e 'TotalSpaces2.display_list.each do |v| TotalSpaces2.move_to_space_on_display('$desktopId', v[:display_id]) end'
    -- ]]
    --
    -- local replace = {
    --   desktopId = goToDesktopId,
    -- }
    --
    -- local command = commandModel:gsub('$(%w+)', replace)
    --
    -- io.popen(command)
    ------------------------------------------------

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
