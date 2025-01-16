let KN = readLine()!.split(separator: " ").map { Int($0)! }
let N = KN[1]
var input = [Int]()
var max = -1
(0..<KN[0]).forEach { _ in 
    let fostjs = Int(readLine()!)!
    input.append(fostjs)
    if max < fostjs {
        max = fostjs
    }
}

var min = 1
var result = 0

while min <= max {
    let mid = (max + min) / 2
    var sum = 0
    for fostjs in input {
        sum += fostjs / mid
    }

    if sum < N {
        max = mid - 1
    } else {
        if result < mid {
            result = mid
        }
        min = mid + 1
    }
}

print(result)