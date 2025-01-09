let N = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }
var result = Array(repeating: -1, count: N)
var stack = [Int]()

for idx in 0..<N {
    while !stack.isEmpty, input[stack.last!] < input[idx] {
        result[stack.removeLast()] = input[idx]
    }

    stack.append(idx)
}

print(result.map { String($0) }.joined(separator: " "))