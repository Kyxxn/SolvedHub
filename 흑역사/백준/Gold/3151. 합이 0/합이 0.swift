import Foundation

var n = Int(readLine()!)!
var input : [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
input.sort()

var count : Int = 0
func solve(_ s: inout Int, _ e: inout Int, _ g: Int) {
    var maxIdx = n
    while s < e {
        let tmp = input[s] + input[e]
        if tmp < g {
            s += 1
        } else if tmp == g {
            if input[s] == input[e] {
                count += e - s
            } else {
                if maxIdx > e {
                    maxIdx = e
                    while maxIdx > 0 && input[maxIdx - 1] == input[e] {
                        maxIdx -= 1
                    }
                }
                count += e - maxIdx + 1
            }
            s += 1
        } else {
            e -= 1
        }
    }
}

for i in 0..<n-1 {
    var start = i + 1
    var end = n - 1
    let goal = -input[i]
    solve(&start, &end, goal)
}

print(count)