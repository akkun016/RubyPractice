def unagi_move(block, moves)
  result = []
  open = [0]
  count = 0
  while moves[count] do
      dist = moves[count]
      queue = []

      until open.empty?
          now = open.shift
          r = now[0] + dist
          l = now[0] - dist
          if block[0] <= l
              queue << [l, "L", now]
          end
          if r <= block[-1]
              queue << [r, "R", now]
          end
      end

      open = queue
      result = queue
      count += 1
  end
  return result
end

nums = gets.chomp.split(" ").map(&:to_i)
block = []
for i in -nums[0]..nums[0] do
  block << i
end
n = nums[1]
moves = []
n.times do
  moves << gets.chomp.to_i
end

result = unagi_move(block, moves)
flatResult = result[0].flatten.each_slice(2).to_a.reverse
for i in 1..(flatResult.size - 1) do
  print flatResult[i][1]
end
