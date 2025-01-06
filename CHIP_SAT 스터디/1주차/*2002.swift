let N = Int(readLine()!)!

var inOrder = [String]()
for _ in 0..<N {
    inOrder.append(readLine()!)
}

var outOrder = [String]()
for _ in 0..<N {
    outOrder.append(readLine()!)
}

var count = 0
var idx = 0
var visited = Set<String>()

for car in outOrder {
    while visited.contains(inOrder[idx]) {
        idx += 1
    }
    if car != inOrder[idx] {
        count += 1
    }
    visited.insert(car)
}

print(count)

// 1 2 3 4 5
// 

// var dict = [String: Int]()
// (0..<N).forEach {
//     let input = readLine()!
//     dict[input, default: 0] = $0
// }
// // 출발 1 2 3 4 5
// // (도착 인덱스, 출발 인덱스) (1, 2) (2, 5) (3, 4) (4, 1) (5, 3)

// var count = 0
// (0..<N).forEach {
//     let input = readLine()!
//     if dict[input]! > $0 {
//         count += 1
//     }
// }
// print(count)