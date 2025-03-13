let XK = readLine()!.split(separator: " ").map { Int($0)! }
let X = XK[0], K = XK[1]
let input = readLine()!.split(separator: " ").map { Int($0)! }

var rightDict = [Int: Int]()

for i in ((2 * X)/2..<2*X) {
    let currentValue = input[i]
    rightDict[currentValue, default: 0] += 1
}

var answer = 0
for i in (0..<(2 * X)/2) {
    let currentValue = input[i]
    answer += X - rightDict[currentValue, default: 0]
}

print(answer)