import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let H = input[0]
    let N = input[2]

    let YY = N % H == 0
    ? H
    : N % H
    let XX = N % H == 0
    ? N / H
    : N / H + 1

    print("\(YY)\(String(format: "%02d", XX))")
}