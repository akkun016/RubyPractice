# 0..1の盤面を作成
# 入力 => 2 3
# 出力 =>
# 1 0 0 1
# 0 1 1 1
# 1 1 1 0
# 0 0 1 0
# 0 0 1 0

nums = gets.chomp.split(" ").map(&:to_i)
h, w = nums[0], nums[1]
grahp = []

h.times do
    queue = []
    w.times do
        queue << rand(0..1)
    end
    grahp << queue
end

grahp.each do |ary|
    item = []
    ary.each do |i|
        item << i
    end
    puts item.join(" ")
end
