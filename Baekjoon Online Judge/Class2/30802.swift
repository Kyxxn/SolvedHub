let N = Int(readLine()!)!
let SML = readLine()!.split(separator: " ").map { Int($0)! }
let TP = readLine()!.split(separator: " ").map { Int($0)! }
let T = TP[0], P = TP[1]

var shirts = 0
SML.forEach { i in 
    if i % T == 0 {
        shirts += i / T
    } else {
        shirts += i / T  + 1
    }
}
print(shirts)
print("\(N / P) \(N % P)")