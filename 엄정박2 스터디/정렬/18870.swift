let N = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }
var set = Set<Int>()
var dict = [Int: Int]()
input.forEach {
    set.insert($0)
}

// array: 2 4 -10 4 -9
// set:  -10 -9 2 4
// dict: [-10: 0, -9: 1, 2: 2, 4:3]
for (idx, value) in set.sorted().enumerated() {
    dict[value, default: 0] = idx
}

input.forEach {
    print(dict[$0]!, terminator: " ")
}