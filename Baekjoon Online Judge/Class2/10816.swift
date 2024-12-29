let _ = readLine()
let array = readLine()!.split(separator: " ").map { Int($0)! }
let _ = readLine()
let input = readLine()!.split(separator: " ").map { Int($0)! }

var dict = [Int: Int]()
array.forEach { i in 
    dict[i, default: 0] += 1
}
input.forEach { i in
    print(dict[i, default: 0], terminator: " ")
}