let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]
let input = readLine()!.split(separator: " ").map { Int($0)! }
var min = 0
var max = input.max()!
var sum = 0
var result = 0

while true {
    let mid = (max + min) % 2 == 0 ? (max + min) / 2 : (max + min + 1) / 2
    for tree in input {
        if tree - mid < 0 { continue }
        sum += tree - mid
    }

    if sum == M {
        print(mid)
        break
    }

    if sum < M {
        max = mid
        sum = 0
    } else {
        min = mid
        sum = 0
        result = result < mid ? mid : result
    }

    if min + 1 == max {
        print(result)
        break
    }
}

// 4 7
// 20 15 10 17
// 15

// min 0 max 20 = mid 10
// 10 5 0 7 = 22
// sum > M

// min 10 max 20 = mid 15
// 5 0 0 2 = 7