# ボウリングの得点に関するコード
def strike(scores, r, fl, pn)
  if r != (fl - 1)
      if scores[r + 1][0] == pn && r != fl - 2
          result = scores[r + 1][0] + scores[r + 2][0] + pn
      else
          result = scores[r + 1][0] + scores[r + 1][1] + pn
      end
  else
      result = scores[r][1] + scores[r][2] + scores[r].sum
  end
  return result
end

def spare(scores, r, fl, pn)
  if r != (fl - 1)
      result = scores[r + 1][0] + pn
  else
      result = scores[r][2] + scores[r].sum
  end
  return result
end

nums = gets.chomp.split(" ").map(&:to_i)
fl, pn, n = nums[0], nums[1], nums[2]
ary = gets.chomp.split(" ").map(&:to_i)

# ピンをすべて倒しており、１投目の場合はその後に０を代入する
count = 0
ary.each do |i|
  if i == pn && count % 2 == 0 && count / 2 != (fl - 1)
      ary.insert(count + 1, 0)
  end
  count += 1
end

# スコアを2つごとに配列に入れる
scores = ary.each_slice(2).to_a
if scores.size != fl
  if scores.size - fl == 1
      scores[-2] += scores[-1]
      scores.slice!(-1)
  elsif scores.size - fl == 2
      scores[-3] += (scores[-2] + scores[-1])
      scores.slice!(-2..-1)
  end
end
p scores

# # スコアの合計値を出していく
total = 0
for r in 0..(fl - 1) do
  if scores[r][0] + scores[r][1] >= pn
      if scores[r][0] == pn
          total += strike(scores, r, fl, pn)
      else
          total += spare(scores, r, fl, pn)
      end

      if r == (fl - 1) && scores[r][0] == pn && scores[r][1] == pn
          total += scores[r][2]
      end
  else
      total += scores[r].sum
  end
end

p total
