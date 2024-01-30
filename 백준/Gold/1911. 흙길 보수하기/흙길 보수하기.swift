import Foundation

var input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], L = input[1]
var puddle: [(Int, Int)] = []
for _ in 0..<N {
    input = readLine()!.split(separator: " ").map{Int(String($0))!}
    puddle.append((input[0], input[1]))
}

puddle.sort { $0.0 < $1.0 }
// (1, 6), (8, 12), (13, 17)

var count = 0
var board_idx = 0

for i in 0..<puddle.count {
    board_idx = max(puddle[i].0, board_idx)
    // 1
    
    while (puddle[i].1 - board_idx > 0) {
        board_idx += L
        count += 1
    }
}

print(count)