def dijkstra(maze, st_h, st_w, g_h)
  cost = 0
  @open = [[st_h, st_w, cost]]
  @closed = []
  costs = []
  until @open.empty?
      item = @open.sort_by!{ |h, w, c| c }.shift
      @closed << [item[0], item[1]]
      if item[0] == g_h
          costs << [item[1], item[2]]
      end

      if_func(maze, item[0] + 1, item[1], item[2])
      if_func(maze, item[0] - 1, item[1], item[2])
      if_func(maze, item[0], item[1] + 1, item[2])
      if_func(maze, item[0], item[1] - 1, item[2])
  end
  return costs
end

def if_func(maze, i_h, i_w, i_c)
  if i_h != -1 && i_h != @h && i_w != -1 && i_w != @w && !@closed.include?([i_h, i_w])
      ncost = maze[i_h][i_w] + i_c
      @open << [i_h, i_w, ncost]
  end
end

nums = gets.chomp.split(" ").map(&:to_i)
@h, @w = nums[0], nums[1]
maze = []
@h.times do
  maze << gets.chomp.split(" ").map(&:to_i)
end

st_h, st_w = 0, 0
g_h = (@h - 1)
ans = dijkstra(maze, st_h, st_w, g_h)
g_ans = ans.group_by{ |w, c| w }.sort.to_h
g_ans.each do |k, v|
  puts v[0][1]
end
