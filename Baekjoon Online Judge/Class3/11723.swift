let M = Int(readLine()!)!
var bit = 0

(0..<M).forEach { i in 
    let input = readLine()!.split(separator: " ").map { String($0) }
    let value = Int(input.last!)!
    switch input[0] {
        case "add": bit |= 1 << value
        case "remove": bit &= ~(1 << value)
        case "check": print((bit & 1 << value) != 0 ? "1" : "0")
        case "toggle": bit ^= (1 << value)
        case "all": bit = (1 << value + 1) - 1
        case "empty": bit = 0
        default: break
    }
}

// 1. Set으로 품 -> 실패
// 2. 아래처럼 20개만 갖고 0, 1로 배열 판단 -> 실패
// let M = Int(readLine()!)!
// var array = Array(repeating: 0, count: 20)
// (0..<M).forEach { i in 
//     let input = readLine()!.split(separator: " ").map { String($0) }
//     switch input[0] {
//         case "add": array[Int(input[1])! - 1] = 1
//         case "remove": array[Int(input[1])! - 1] = 0
//         case "check": print(array[Int(input[1])! - 1] == 1 ? "1" : "0")
//         case "toggle": (array[Int(input[1])! - 1] == 1) ? (array[Int(input[1])! - 1] = 0) : (array[Int(input[1])! - 1] = 1)
//         case "all": array = Array(repeating: 1, count: 20)
//         case "empty": array = Array(repeating: 0, count: 20)
//         default: break
//     }
// }