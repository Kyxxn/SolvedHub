let XY = readLine()!.split(separator: " ").map { Int($0)! }
let X = XY[0], Y = XY[1]
var Z = (Y * 100) / X
var result = -1
var left = 0
var right = X

while left <= right {
    let mid = (left + right) / 2
    if ((Y + mid) * 100) / (X + mid) > Z {
        result = mid
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print(result)