var array: [Int] = []
for _ in 0..<10 {
    array.append(Int(readLine()!)!)
}

var result: [Int] = []
for num in array {
    let remainder = num % 42
    if !result.contains(remainder) {
        result.append(remainder)
    }
}

print(result.count)