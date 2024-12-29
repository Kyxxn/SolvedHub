let NM = readLine()!.split(separator:  " ").map { Int($0)!} 
let N = NM[0], M = NM[1]
var puzzle = [[Character]]()
(0..<N).forEach { _ in
    puzzle.append(readLine()!.map { $0 })
}

var minCount = 99
for w in 0...N - 8 {
    for h in 0...M - 8 {
        var count1 = 0
        var count2 = 0

        for i in w..<w + 8 {
            for j in h..<h + 8 {
                if (i + j) % 2 == 0 {
                    if puzzle[i][j] == "B" {
                        count1 += 1
                    } else {
                        count2 += 1
                    }
                } else {
                    if puzzle[i][j] == "B" {
                        count2 += 1
                    } else { 
                        count1 += 1
                    }
                }
            }
        }
        minCount = min(minCount, count1, count2)
    }
}

print(minCount)