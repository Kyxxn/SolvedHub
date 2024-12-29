let NK = readLine()!.split(separator:  " ").map { Int($0)!} 
let N = NK[0], K = NK[1]
var array = Array(1...N)
var result = [Int]()
var currentIndex = 0

(0..<N).forEach { i in 
    currentIndex = (currentIndex + K - 1) % array.count
    result.append(array.remove(at: currentIndex))
}

print("<\(result.map { String($0) }.joined(separator: ", "))>")