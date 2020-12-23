# カエルが段差を飛ぶ時(i + 1 || i + 2)のコスト
# 2 9 4 5 1 6 10 => 8
def dp(array)
    ary_size = array.size
    queue = [0]
    for i in 0..(ary_size - 1) do
        if i == 0
            queue << array[i]
        else
            cost_1 = (queue[i - 1] - array[i]).abs
            cost_2 = (queue[i - 2] - array[i]).abs
            queue << [cost_1, cost_2].min
        end
    end
    return queue.last
end

array = gets.chomp.split(" ").map(&:to_i)
p dp(array)
