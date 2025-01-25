let N = Int(readLine()!)!
let cards = Set(readLine()!.split(separator: " ").map { Int($0)! })
let M = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }

var result = ""
input.forEach { 
    if cards.contains($0) {
        result += "1 "
    } else {
        result += "0 "
    }
}
print(result)