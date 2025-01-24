let input = readLine()!.map { String($0) }
var set = Set<Int>()

for start in 0..<input.count {
    var str = ""
    for j in start..<input.count {
        str += input[j]
        set.insert(str.hashValue)
    }
}

print(set.count)