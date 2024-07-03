import Foundation

let A = Int(readLine()!)!
let B = Int(readLine()!)!
let C = Int(readLine()!)!

var map = [
    0: 0,
    1: 0,
    2: 0,
    3: 0,
    4: 0,
    5: 0,
    6: 0,
    7: 0,
    8: 0,
    9: 0
]

let str = String(A*B*C)
for char in str {
    map[Int(String(char))!]! += 1
}

for i in 0..<10 {
    print(map[i]!)
}
