# 盤面の島の数をカウントするコード
# 数が多くなるとその分処理が遅くなってしまう

def island(array)
    @open = []
    @closed = []
    count = 0
    for i in 0..(@h - 1) do
        for j in 0..(@w - 1) do
            if array[i][j] == 1 && !@closed.include?([i, j])
                @open << [i, j]
                until @open.empty?
                    item = @open.shift
                    @closed << item
                    if_func(array, item[0] + 1, item[1])
                    if_func(array, item[0] - 1, item[1])
                    if_func(array, item[0], item[1] + 1)
                    if_func(array, item[0], item[1] - 1)
                end
                count += 1
            else
                next
            end
        end
    end
    return count
end

def if_func(array, h, w)
    if !@closed.include?([h, w]) && h != @h && h != -1 && w != @w && w != -1
        if array[h][w] == 1
            @open << [h, w]
        end
    end
end

# 入力コード
# 6 6
# 1 1 1 1 1 1
# 1 0 1 0 0 0
# 1 0 1 0 1 1
# 0 1 0 0 0 1
# 1 0 1 1 1 1
# 0 1 0 0 0 0

nums = gets.chomp.split(" ").map(&:to_i)
@w, @h = nums[0], nums[1]

array = []
@h.times do
    array << gets.chomp.split(" ").map(&:to_i)
end

p island(array)
