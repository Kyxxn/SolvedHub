func gcd(_ a: Int, _ b: Int) -> Int {
    b == 0
    ? a
    : gcd(b, a % b)
}

let AB = readLine()!.split(separator:  " ").map { Int($0)!} 
let A = AB[0], B = AB[1]
print(gcd(A, B))
print(A * B / gcd(A, B))