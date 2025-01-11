while let input = readLine() {
    guard input != "." else { break }

    var isVPS = true
    var stack = [Character]()

    for char: Character in input {
        if char == "(" || char == "[" {
            stack.append(char)
        } else if char == ")" {
            if stack.isEmpty {
                isVPS = false
                break
            }
            let popValue = stack.removeLast()
            if popValue != "(" {
                isVPS = false
                break
            }
        } else if char == "]" {
            if stack.isEmpty {
                isVPS = false
                break
            }
            let popValue = stack.removeLast()
            if popValue != "[" {
                isVPS = false
                break
            }
        }
    }

    if !stack.isEmpty { isVPS = false }

    print(isVPS ? "yes" : "no")
}