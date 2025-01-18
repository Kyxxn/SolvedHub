let N = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }

var fDict = [Int: Int]()
input.forEach { fDict[$0, default: 0] += 1 }

var result = Array(repeating: -1, count: N)
var stack = [Int]()

for i in stride(from: N - 1, through: 0, by: -1) {
    let currentFValue = fDict[input[i]]!
    while !stack.isEmpty, fDict[input[stack.last!]]! <= currentFValue {
        stack.removeLast()
    }

    if let topIndex = stack.last {
        result[i] = input[topIndex]
    }
    stack.append(i)
}

print(result.map { String($0) }.joined(separator: " "))