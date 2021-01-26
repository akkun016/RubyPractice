# 範囲の中の積(n)がkより大きくなる時の最小の範囲

nums = gets.chomp.split(" ").map(&:to_i)
n, k = nums[0], nums[1]
ary = gets.chomp.split(" ").map(&:to_i)
# ary.insert(0, 1)
# 最初の"２"から始めるため
str = ary.index(2)

count = 0
if k == 1 && ary.include?(1)
    count = 1
elsif k == 2 && ary.include?(2)
    count = 1
else
    # r より1つ前に l が来るから
    l = str
    for r in str..n do
        # r が l より大きい必要がある
        if l <= r
            if ary[r] == 0
                # r を機転に 次の2を探すため
                l = r + 1
                while ary[l] != 2 && ary[l] != nil
                    l += 1
                end
            else
                if k <= 2 ** ary[l..r].count(2)
                    if count == 0
                        count = r - l + 1
                    elsif count > r - l
                        count = r - l + 1
                    end

                    while k <= 2 ** ary[(l + 1)..r].count(2)
                        l += 1
                        if count > r - l
                            count = r - l + 1
                        end
                    end
                end
            end
        end
    end
end

puts count