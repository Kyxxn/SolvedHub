func isPrime(number: Int) -> Bool {
    guard number != 1 else { return false }

    var isPrime = true
    for i in 2..<number {
        if number % i == 0 {
            isPrime = false
        }
    }
    return isPrime
}

let _ = readLine()
let input = readLine()!.split(separator:  " ").map { Int($0)!} 
var count = 0
input.forEach { i in 
    if isPrime(number: i) {
        count += 1
    }
}
print(count)