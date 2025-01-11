let N = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { (Int(String($0))!) }
var stack = [Int]()
var currentValue = 1
input.forEach {
    if $0 == currentValue {
        currentValue += 1
    } else {
        stack.append($0)
    }

    while !stack.isEmpty, stack.last! == currentValue {
        currentValue += 1
        stack.removeLast()
    }
}
print(currentValue == N + 1 && stack.isEmpty ? "Nice" : "Sad")