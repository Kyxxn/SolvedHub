let T = Int(readLine()!)!
(0..<T).forEach { i in
    let input = readLine()!
    var openArray: [Character] = [Character]()
    var isVPS = true
    
    for char in input {
        if char == "(" {
            openArray.append(char)
        } else {
            if openArray.isEmpty {
                isVPS = false
                break
            }
            openArray.removeLast()
        }
    }
    if openArray.count != 0 { isVPS = false }
    print(isVPS ? "YES" : "NO")
}