let N = Int(readLine()!)!
var array = [Int]()
(0..<N).forEach { i in
    array.append(Int(readLine()!)!)
}
print(array.sorted().map { String($0) }.joined(separator: "\n"))