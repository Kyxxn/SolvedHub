let N = Int(readLine()!)!
var array = [Int]()
(0..<N).forEach { _ in 
    array.append(Int(readLine()!)!)
}

var resultArray = Array(repeating: 0, count: N)
var stack = [(Int, Int)]()
for (currentIndex, currentValue) in array.enumerated() {
    while !stack.isEmpty, let last = stack.last, last.1 <= currentValue {
        resultArray[last.0] = currentIndex - last.0 - 1
        stack.removeLast()
    }

    stack.append((currentIndex, currentValue))
}

while !stack.isEmpty {
    let last = stack.removeLast()
    resultArray[last.0] = N - last.0 - 1
}

print(resultArray.reduce(0, +))