let N = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }
var info = [(Int, Int)]()
(0..<N).forEach { i in
    info.append((i, input[i]))
}
info.sort { $0.1 < $1.1 }

var sum = 0
var currentSum = 0
info.forEach {
    currentSum += $0.1
    sum += currentSum
}
print(sum)