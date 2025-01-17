let input = readLine()!
let c4 = readLine()!
var stack = [Character]()

for char in input {
    stack.append(char)
    if stack.last! == c4.last!, stack.count >= c4.count,
    stack[stack.count - c4.count..<stack.count].map { String($0) }.joined(separator: "") == c4 {
        stack.removeLast(c4.count)
    }
}

print(stack.isEmpty ? "FRULA" : stack.map { String($0) }.joined(separator: ""))