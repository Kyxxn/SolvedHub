let _ = readLine()
let input = readLine()!.split(separator:  " ").map { Int($0)!} 

let max = input.max()!
var result = 0.0
input.forEach { i in 
    result += Double(i) / Double(max) * Double(100)
}
print(result / Double(input.count))