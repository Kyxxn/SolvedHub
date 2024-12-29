let N = Int(readLine()!)!
var array = [Int]()
(0..<N).forEach { _ in
    let input = readLine()!.split(separator: " ").map { String($0) }
    switch input[0] {
        case "push": array.append(Int(input[1])!)
        case "top": print(array.isEmpty ? "-1" : array.last!)
        case "size": print(array.count)
        case "empty": print(array.isEmpty ? "1" : "0")
        case "pop": print(array.isEmpty ? "-1" : array.removeLast())
        default: break
    }
}