$debug = true

def dfs(result, string = "")
    # 文字を代入する
    result << string unless string.empty?

    # 文字列が3文字になれば、ループを停止してあげる
    if string.length == 3
        result << "<>" if $debug
        return
    end

    dfs(result, string + "A")
    dfs(result, string + "B")
    dfs(result, string + "C")
end

result = []
dfs(result)
p result
