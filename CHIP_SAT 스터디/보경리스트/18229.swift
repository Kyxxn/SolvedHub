let NMK = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M, K) = (NMK[0], NMK[1], NMK[2])

var input = Array(repeating: [Int](), count: N)
(0..<N).forEach { input[$0] = readLine()!.split(separator: " ").map { Int($0)! } }

var isFinish = false
var total = Array(repeating: 0, count: N)
var answer = (0, 0)

for i in 0..<M {
    if !isFinish {
        for j in 0..<N {
            total[j] += input[j][i]
            if total[j] >= K {
                answer = (j+1, i+1)
                isFinish = true
                break
            }
        }
    }

    if isFinish { break }
}

print("\(answer.0) \(answer.1)")