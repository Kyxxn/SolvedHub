let MN = readLine()!.split(separator: " ").map { Int($0)! }
let M = MN[0], N = MN[1]
var array = Array(repeating: true, count: N + 5)
array[0] = false
array[1] = false

for idx in 2..<N+5 {
    if idx * idx > N {
        break
    }
    if array[idx] {
        var j = idx * idx
        while true {
            if j > N {
                break
            }
            array[j] = false
            j += idx
        }
    }
}

for idx in M..<N+1 {
    if array[idx] {
        print(idx)
    }
}