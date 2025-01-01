let T = Int(readLine()!)!
(0..<T).forEach { _ in 
    func dfs(_ x: Int, _ y: Int) {
        visited[x][y] = true

        if cabbageField[x][y] {
            for i in 0..<4 {
                let newX = dx[i] + x
                let newY = dy[i] + y
                if 0 <= newX && newX < M && 0 <= newY && newY < N && !visited[newX][newY] && cabbageField[newX][newY] {
                    dfs(newX, newY)
                }
            }
        }
    }
    let MNK = readLine()!.split(separator: " ").map { Int($0)! }
    let M = MNK[0], N = MNK[1], K = MNK[2]
    let dx = [0, 0, -1, 1]
    let dy = [1, -1, 0, 0]
    var cabbageField = Array(repeating: Array(repeating: false, count: N), count: M)
    var visited = Array(repeating: Array(repeating: false, count: N), count: M)
    (0..<K).forEach { _ in
        let xy = readLine()!.split(separator: " ").map { Int($0)! }
        let x = xy[0], y = xy[1]
        cabbageField[x][y] = true
    }
    var count = 0
    for i in 0..<M {
        for j in 0..<N {
            if cabbageField[i][j] && !visited[i][j] {
                dfs(i, j)
                count += 1
            }
        }
    }
    print(count)
}