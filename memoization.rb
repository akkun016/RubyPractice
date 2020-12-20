def f_memo(n)
  return n if n <= 1
  @cache ||= []
  @cache[n] ||= f_memo(n-1) + f_memo(n-2)
end

n = 1000
p f_memo(n)
