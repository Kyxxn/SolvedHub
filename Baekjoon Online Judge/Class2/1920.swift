let _ = readLine()
let N = readLine()!.split(separator:  " ").map { Int($0)!} 
let _ = readLine()
let M = readLine()!.split(separator:  " ").map { Int($0)!} 

var dict = [Int: Int]()
N.forEach { dict[$0, default: 0] = 1 }
M.forEach { print(dict[$0] == 1 ? "1" : "0")}
