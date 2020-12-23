# プリム法に関するコード
def dijkstra(maze, st_h, st_w, g_h, g_w)
  cost = 0
  @open = [[st_h, st_w, cost]]
  @closed = []
  until @open.empty? do
      item = @open.sort_by!{|h, w, c| c}.shift
      if @closed.include?([item[0], item[1]])
          next
      end
      @closed << [item[0], item[1]]
      cost += item[2]

      if @closed.size == @h * @w
          return cost
      end

      if_func(maze, item[0] + 1, item[1], item[2], item)
      if_func(maze, item[0] - 1, item[1], item[2], item)
      if_func(maze, item[0], item[1] + 1, item[2], item)
      if_func(maze, item[0], item[1] - 1, item[2], item)
  end
end

def if_func(maze, h, w, c, item)
  if h != -1 && h != @h && w != -1 && w != @w
      ncost = maze[h][w] * maze[item[0]][item[1]]
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
