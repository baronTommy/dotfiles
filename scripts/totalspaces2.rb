# !/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'totalspaces2'

class Totalspaces2

  # デスクトップ移動
  def goToSpace(target_space)
    # 移動
    TotalSpaces2.move_to_space(spaceNameConversion(target_space))
  end

  # ウィンドウ移動
  def sendToSpace(target_space)
      # 全ウィンドウ取得
      windows = TotalSpaces2.window_list
      if windows.empty?
        # ウィンドウ無し
        return
      end

      # 現在のウィンドウ取得
      current_space = TotalSpaces2.current_space
      main_display_id = TotalSpaces2.main_display[:display_id]

      # アクティブウィンドウ取得
      current_space_windows = windows.select {|window| window[:display_id] == main_display_id && window[:space_number] == current_space}
      front_window = current_space_windows[0]

      # アクティブウィンドウ移動
      TotalSpaces2.move_window_to_space(front_window[:window_id], spaceNameConversion(target_space))
  end

  private
    # 論理名からspaceNo.へ変換
    def spaceNameConversion(space_name)
      # spacesをループ
      for space in 1..TotalSpaces2.number_of_spaces
          # spaceを論理名に変更
          if TotalSpaces2.name_for_space(space) == space_name
              return space.to_i
              break
          end
      end
    end
end

ts = Totalspaces2.new()
if ARGV[1] == 'true' then
  ts.sendToSpace(ARGV[0])
end
if ARGV[2] == 'true' then
  ts.goToSpace(ARGV[0])
end
