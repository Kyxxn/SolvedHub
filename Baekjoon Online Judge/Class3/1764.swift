let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]

var dict = [String: Bool]()
var result = [String]()
(0..<N + M).forEach { _ in 
    let input = readLine()!
    if dict[input, default: false] { result.append(input) }
    dict[input, default: false] = true
}

print(result.count)
print(result.sorted().joined(separator: "\n"))