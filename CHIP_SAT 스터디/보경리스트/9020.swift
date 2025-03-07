let T = Int(readLine()!)!

var primes = Array(repeating: true, count: 10100)
primes[0] = false
primes[1] = false

for idx in 2..<10005 where idx * idx < 10005 {
    if idx * idx > 10005 { break }
    if !primes[idx] { continue }
    
    var standard = idx * idx
    while true {
        if standard > 10005 { break }
        primes[standard] = false
        standard += idx
    }
}

(0..<T).forEach { _ in 
    let N = Int(readLine()!)!
    var standard = N / 2

    while true {
        let otherPrime = N - standard 
        if primes[standard] && primes[otherPrime] {
            print("\(standard) \(otherPrime)")
            break
        }
        standard -= 1
    }
}