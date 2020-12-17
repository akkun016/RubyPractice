nums = gets.chomp.split(" ").map(&:to_i)
n, k = nums[0], nums[1]
ary = gets.chomp.split(" ").map(&:to_i)

ans = 0
if k == 1
    if ary.include?(1)
        ans = 1
    end
elsif k == 2
    if ary.include?(2)
        ans = 1
    end
else
    pro = 1
    l = 0
    for r in 0..(n - 1) do
        if r >= l
            while ary[l] != 2 && l <= (n - 1) do
                l += 1
            end
            
            if ary[r] == 0
                l = r + 1
                pro = 1
                while ary[l] != 2 && l <= (n - 1) do
                    l += 1
                end
            else
                pro *= ary[r]
                if pro >= k
                    if ans > (r - l) + 1 || ans == 0
                        ans = (r - l) + 1
                    end
                end
            end
        else
            next
        end
    end
end

p ans
