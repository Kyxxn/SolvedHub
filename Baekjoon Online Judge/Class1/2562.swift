var maxNumber = -1
var maxNumberIndex = -1

(0..<9).forEach { i in
    let input = Int(readLine()!)!
    if input > maxNumber {
        maxNumber = input
        maxNumberIndex = i + 1
    }
}

print(maxNumber)
print(maxNumberIndex)