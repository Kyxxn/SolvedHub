import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    let HWN = readLine()!.split(separator: " ").map { Int($0)! }
    // H 층수, W 방수, N 몇 번째 손님
    let H = HWN[0]
    let N = HWN[2]
    
    var floor = N % H
    var room = N / H + 1
    
    if floor == 0 {
        floor = H
        room -= 1
    }
    
    print(String(format: "%d%02d", floor, room))
}