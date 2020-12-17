$debug = true

def bfs(result)
    # キューとなる配列を用意
    queue = [""]
    until queue.empty? do
        # キューの先頭からstringに代入していく
        string = queue.shift

        result << string unless string.empty?

        if string.length == 3
            result << "<>" if $debug
        else
            # stringの後にそれぞれの文字列を付ける
            queue << string+"A"
            queue << string+"B"
            queue << string+"C"
        end
    end
end

result = []
bfs(result)
p result
