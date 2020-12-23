# DFSについて
# 本コードは迷路の最短経路のコストについて
def bfs(maze, st_h, st_w, g_h, g_w)
  # open には分岐点から別れた分身すべてが入り、それらをすべてチェックする
  open = [[st_h, st_w]]
  # チェックしたものをすべて入れる
  closed = []
  cost = 0

  while true do
      @queue = []
      until open.empty? do
          item = open.shift
          closed << item

          # ゴールに着いたら終了する
          if item == [g_h, g_w]
              return cost + 1
          else
              # 今、チェックしている場所の４方向の状態をみる
              if_func(closed, item[0] + 1, item[1], maze)
              if_func(closed, item[0] - 1, item[1], maze)
              if_func(closed, item[0], item[1] + 1, maze)
              if_func(closed, item[0], item[1] - 1, maze)
          end
      end
      # open を @queue に入れたものに変換する(etc..[2, 2], [1, 3])
      open = @queue
      cost += 1
  end
end

def if_func(closed, item_h, item_w, maze)
  if !closed.include?([item_h, item_w]) && item_h != -1 && item_w != -1 && item_h != @h && item_w != @w && maze[item_h][item_w] == 0
      @queue << [item_h, item_w]
  end
end

nums = gets.chomp.split(" ").map(&:to_i)
@h, @w = nums[0], nums[1]
maze = []
@h.times do
  maze << gets.chomp.split(" ").map(&:to_i)
end

st_h, st_w = 0, 0
g_h, g_w = (@h - 1), (@w - 1)
p bfs(maze, st_h, st_w, g_h, g_w)
