nums = gets.chomp.split(" ").map(&:to_i)
n, k = nums[0], nums[1]
array = gets.chomp.split(" ").map(&:to_i)

count = 0
mult = 1
l = 0
if k == 1 || k == 2
    if array.include?(k)
        count = 1
    else
        count = 0
    end
else
    for i in 0..(n - 1)
        if array[i] != 0 && array[l] == 2
            mult *= array[i]
            if mult >= k
                if count > i - l + 1|| count == 0
                    count = i - l + 1
                end
            end
        else
            mult = 1
            l = i + 1
        end
    end
end

p count