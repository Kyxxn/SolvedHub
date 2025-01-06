let N = Int(readLine()!)!
var map = [String: Bool]()
var count = 0
(0..<N).forEach { _ in 
    let input = readLine()!
    if input == "ENTER" {
        map.removeAll()
    } else {
        if !map[input, default: false] {
            map[input, default: false] = true
            count += 1
        }
    }
}

print(count)