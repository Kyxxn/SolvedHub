// 00:52 시작
// 레버를 당겨야만 미로를 빠져나갈 수 있음
// 시작 -> 레버 찾기 BFS
// 레버 -> 출구 찾기 BFS
import Foundation

func solution(_ maps:[String]) -> Int {
    let dx = [-1,1,0,0], dy = [0,0,-1,1]
    var start: (Int, Int) = (0, 0)
    var lever: (Int, Int) = (0, 0)
    var end: (Int, Int) = (0, 0)
    var mapParsing: [[Character]] = []
    
    // 시작지점 및 레버찾기
    for (i, map) in maps.enumerated() {
        for (k, l) in map.enumerated() {
            if l == "S" {
                start = (i, k)
            }else if l == "L" {
                lever = (i, k)
            }else if l == "E" {
                end = (i, k)
            }
        }
        mapParsing.append(Array(map))
    }

    func bfs(first: (Int, Int), last: (Int, Int)) -> Int? {
        var distance = Array(repeating: Array(repeating: -1, count: maps[0].count), count: maps.count)
        var queue: [(Int, Int)] = [first]
        distance[first.0][first.1] = 0
        
        while !queue.isEmpty {
            let cur: (Int, Int) = queue.removeFirst()
            let curX = cur.0, curY = cur.1
            
            for i in 0..<4 {
                let nx = curX + dx[i], ny = curY + dy[i]
                let maxX = maps.count, maxY = maps[0].count
                if nx < maxX && nx >= 0 && ny >= 0 && ny < maxY {
                    if mapParsing[nx][ny] != "X" && distance[nx][ny] == -1{
                        queue.append((nx, ny))
                        distance[nx][ny] = distance[curX][curY] + 1
                        if (nx, ny) == last {
                            return distance[nx][ny]
                        }
                    }
                }
            }
        }
        
        return nil
    }
    
    guard let startToLeverTime: Int = bfs(first: start, last: lever) else {return -1}
    guard let leverToEndTime: Int = bfs(first: lever, last: end) else {return -1}

    return startToLeverTime + leverToEndTime
}