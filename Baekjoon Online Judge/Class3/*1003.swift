let T = Int(readLine()!)!
var fibonacci = Array(repeating: (0, 0), count: 41)
fibonacci[0] = (1, 0)
fibonacci[1] = (0, 1)

var test = [Int]()
(0..<T).forEach { _ in test.append(Int(readLine()!)!) }

for i in 2..<fibonacci.count {
    fibonacci[i] = (fibonacci[i - 1].0 + fibonacci[i - 2].0, fibonacci[i - 1].1 + fibonacci[i - 2].1)
}

test.forEach { print("\(fibonacci[$0].0) \(fibonacci[$0].1)") }