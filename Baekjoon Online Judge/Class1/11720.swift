let _ = readLine()
let N = readLine()!

var result = 0
for number in N {
    let intNumber = Int(String(number))!
    result += intNumber
}

print(result)