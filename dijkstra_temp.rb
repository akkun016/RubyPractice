# ダイクストラ法について
# ダイクストラ法とは、変に重みのあるグラフにおいて２頂点間の最小コストの算出の際に利用する。
# <入力>
# 3 3
# 3 1 4
# 1 5 9
# 2 6 5

def dijkstra(maze, st_h, st_w, g_h, g_w)
  @open = [[st_h, st_w, 0]]
  @closed = []
  until @open.empty? do
      item = @open.sort_by!{|h, w, c| c}.shift
      @closed << [item[0], item[1]]
      if [item[0], item[1]] == [g_h, g_w]
          return item[2]
      end

      if_func(maze, item[0] + 1, item[1], item[2])
      if_func(maze, item[0] - 1, item[1], item[2])
      if_func(maze, item[0], item[1] + 1, item[2])
      if_func(maze, item[0], item[1] - 1, item[2])
  end
end

def if_func(maze, h, w, c)
  if h != -1 && h != @h && w != -1 && w != @w && !@closed.include?([h, w])
      ncost = c + maze[h][w]
      @open << [h, w, ncost]
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
p dijkstra(maze, st_h, st_w, g_h, g_w)
