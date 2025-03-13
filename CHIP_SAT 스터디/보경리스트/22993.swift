let N = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map { Int($0)! }

var currentAD = input[0]
var enemies = Array(input[1..<N].sorted())
var isWin = true
for enemy in enemies {
    if currentAD > enemy {
        currentAD += enemy
    } else {
        isWin = false
        break
    }
}

print(isWin ? "Yes" : "No")