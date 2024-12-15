let AX = readLine()!.split(separator: " ").map { Int($0)! }
let B = AX[1]
let input = readLine()!.split(separator: " ").map { Int($0)! }.filter { $0 < B }

input.forEach {
    print($0, terminator: " ")
}