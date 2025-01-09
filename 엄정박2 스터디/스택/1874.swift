let N = Int(readLine()!)!

var input = [Int]()
(0..<N).forEach { _ in
    input.append(Int(readLine()!)!)
}
var array = input.sorted()
var stack = [Int]()
var result = [String]()
var isSequence = false

var currentIndex = 0
array.forEach { sortedValue in 
    if sortedValue <= input[currentIndex] {
        stack.append(sortedValue)
        result.append("+")
    }

    while !stack.isEmpty, stack.last! == input[currentIndex] {
        stack.removeLast()
        result.append("-")
        currentIndex += 1
    }
}

if stack.isEmpty {
    print(result.joined(separator: "\n"))
} else {
    print("NO")
}