let input = readLine()!
let N = input.count

var answer = 0
var pow = 1
for char in input {
    if char == "O" {
        answer = (answer + pow) % 1000000007
    }
    pow = (pow * 2) % 1000000007
}

print(answer)