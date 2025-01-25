let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0], m = nm[1]
var s = Set<Int>()

for _ in 0..<n {
    s.insert(readLine()!.hashValue)
}

var result = 0
for _ in 0..<m {
    if s.contains(readLine()!.hashValue) { result += 1 }
}
print(result)