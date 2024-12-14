let input = readLine()!.split(separator: " ").map { Int($0)! }

var sum = 0
input.forEach { num in
    let verifyNumber = num * num
    sum += verifyNumber
}

print(sum % 10)