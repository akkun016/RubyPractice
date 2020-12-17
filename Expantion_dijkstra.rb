def dijkstra(array, st_h, st_w, g_h, g_w, ticket)
    cost = 0
    @open = [[st_h, st_w, cost, ticket]]
    @closed = []
    until @open.empty? do
        @open.sort_by!{ |h, w, c, t| c }
        item = @open.shift
        @closed << [item[0], item[1], item[3]]

        if [item[0], item[1]] == [g_h, g_w]
            return item[2]
        end

        if_func(array, item[0] - 1, item[1], item[2], item[3])
        if_func(array, item[0] + 1, item[1], item[2], item[3])
        if_func(array, item[0], item[1] - 1, item[2], item[3])
        if_func(array, item[0], item[1] + 1, item[2], item[3])
    end
end

def if_func(array, i_h, i_w, i_c, ticket)
    if i_h != -1 && i_h != @h && i_w != -1 && i_w != @w && !@closed.include?([i_h, i_w, ticket])
        ncost = array[i_h][i_w] + i_c
        @open << [i_h, i_w, ncost, ticket]
        if ticket > 0
            ncost_1 = i_c
            @open << [i_h, i_w, ncost_1, ticket - 1]
        end
    end
end

nums = gets.chomp.split(" ").map(&:to_i)
@h, @w = nums[0], nums[1]
array = []
@h.times do
    array << gets.chomp.split(" ").map(&:to_i)
end
ticket = gets.chomp.to_i

st_h, st_w = 0, 0
g_h, g_w = (@h - 1), (@w - 1)
puts dijkstra(array, st_h, st_w, g_h, g_w, ticket)


# ルートの表示あり
def dijkstra(array, st_h, st_w, g_h, g_w, ticket)
    cost = 0
    @open = [[st_h, st_w, cost, ticket]]
    @closed = []
    until @open.empty? do
        @open.sort_by!{ |h, w, c, t| c }
        item = @open.shift
        @closed << [item[0], item[1], item[3]]
  
        if [item[0], item[1]] == [g_h, g_w]
            return item[2]
        end
  
        if_func(array, item[0] - 1, item[1], item[2], item[3])
        if_func(array, item[0] + 1, item[1], item[2], item[3])
        if_func(array, item[0], item[1] - 1, item[2], item[3])
        if_func(array, item[0], item[1] + 1, item[2], item[3])
    end
end

def if_func(array, i_h, i_w, i_c, ticket)
    if i_h != -1 && i_h != @h && i_w != -1 && i_w != @w && !@closed.include?([i_h, i_w, ticket])
        ncost = array[i_h][i_w] + i_c
        @open << [i_h, i_w, ncost, ticket]
        if ticket > 0
            ncost_1 = i_c
            @open << [i_h, i_w, ncost_1, ticket - 1]
        end
    end
end

nums = gets.chomp.split(" ").map(&:to_i)
@h, @w = nums[0], nums[1]
array = []
@h.times do
    array << gets.chomp.split(" ").map(&:to_i)
end
ticket = gets.chomp.to_i

st_h, st_w = 0, 0
g_h, g_w = (@h - 1), (@w - 1)
puts dijkstra(array, st_h, st_w, g_h, g_w, ticket)