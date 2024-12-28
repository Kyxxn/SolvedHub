let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]
let input = readLine()!.split(separator: " ").map { Int($0)! }

var currentMax = 0
for i in 0..<N {
    for j in i+1..<N {
        for k in j+1..<N {
            let currentSum = input[i] + input[j] + input[k]
            if currentSum <= M {
                currentMax = max(currentMax, currentSum)
            }
            if currentMax == M { break }
        }
    }
}

print(currentMax)