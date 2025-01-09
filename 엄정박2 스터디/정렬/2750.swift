let N = Int(readLine()!)!
var array = [Int]()
(0..<N).forEach { _ in 
    array.append(Int(readLine()!)!)
}
array.sorted(by: <).forEach { print($0) }