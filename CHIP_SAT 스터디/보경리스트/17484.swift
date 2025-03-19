let NM = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (NM[0], NM[1])
var map = Array(repeating: [Int](), count: N)

for i in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    map[i] = input
}

var answer = Int.max
let directions = [-1, 0, 1] // 좌하, 하, 우하 방향

func dfs(_ row: Int, _ col: Int, _ prevDir: Int, _ fuel: Int) {
    if row == N {
        answer = min(answer, fuel)
        return
    }

    for i in 0..<3 {
        if i == prevDir { continue } // 이전경로 차단
        let nextCol = col + directions[i]
        if nextCol >= 0 && nextCol < M {
            dfs(row + 1, nextCol, i, fuel + map[row][col])
        }
    }
}

// 모든 열에서 출발
for col in 0..<M {
    dfs(0, col, -1, 0)
}

print(answer)