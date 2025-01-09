var countingArray = Array(repeating: 0, count: 10001)
let N = Int(readLine()!)!
(0..<N).forEach { _ in 
    countingArray[Int(readLine()!)!] += 1
}

var output = ""

(1...10000).forEach { 
    output += String(repeating: "\($0)\n", count: countingArray[$0])
}

print(output)