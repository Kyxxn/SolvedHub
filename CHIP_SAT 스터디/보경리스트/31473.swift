import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    let a = abs(a), b = abs(b)
    return b == 0 ? a : gcd(b, a % b)
}

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }
let B = readLine()!.split(separator: " ").map { Int($0)! }

let sumA = A.reduce(0, +)
let sumB = B.reduce(0, +)

let g = gcd(sumA, sumB)

let a = sumB / g
let b = sumA / g

print("\(a) \(b)")