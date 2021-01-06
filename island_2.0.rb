# 盤面の島の数をカウントするコード
# 改良版
def island(array)
    @open = []
    count = 0
    for i in 0..(@h - 1) do
        for j in 0..(@w - 1) do
            if array[i][j] == 1
                @open << [i, j]
                @closed = []
                until @open.empty?
                    item = @open.shift
                    if array[item[0]][item[1]] == 0
                        next
                    end
                    @closed << item
                    array[item[0]][item[1]] = 0

                    if_func(array, item[0] + 1, item[1])
                    if_func(array, item[0] - 1, item[1])
                    if_func(array, item[0], item[1] + 1)
                    if_func(array, item[0], item[1] - 1)
                end
                count += 1
            end
        end
    end
    return count
end

def if_func(array, h, w)
    if h != @h && h != -1 && w != @w && w != -1
        if array[h][w] == 1
            @open << [h, w]
        end
    end
end

nums = gets.chomp.split(" ").map(&:to_i)
@w, @h = nums[0], nums[1]
grahp = []

@h.times do
    grahp << gets.chomp.split(" ").map(&:to_i)
end
p island(grahp)

# ------------------------------------------------------------------
# 改良内容
# チェック済みを配列に入れて include? で判別するのではなく、
# 盤面自体の数値を0に変え、チェックしている部分が0であれば次に飛ぶように変更

# include? >>> if での判定
# ------------------------------------------------------------------