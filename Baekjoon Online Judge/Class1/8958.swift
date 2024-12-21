let T = Int(readLine()!)!

for _ in 0..<T {
    let input = readLine()!
    var currentCount = 1
    var result = 0
    for char in input {
        if char == "O" {
            result += currentCount
            currentCount += 1
        } else {
            currentCount = 1
        }
    }
    print(result)
}