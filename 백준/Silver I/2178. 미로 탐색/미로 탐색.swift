// 24년 겨울 알고리즘 스터디
// BOJ & 프로그래머스
//
// Created by 박효준 on 1/10/24.

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let N = input[0], M = input[1]
var graph = [[Int]]()
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: M), count: N)
let dx: [Int] = [0,0,-1,1]
let dy: [Int] = [-1,1,0,0]
for _ in 0..<N {
    let tmp = Array(readLine()!).map{Int(String($0))!}
    graph.append(tmp)
}

var distance: [[Int]] = Array(repeating: Array(repeating: 0, count: M), count: N)
func bfs() {
    var queue: [(Int,Int)] = []
    distance[0][0] = 1
    visited[0][0] = true
    queue.append((0,0))
    
    while !queue.isEmpty {
        let tmp = queue.removeFirst()
        for i in 0..<4 {
            let nX = dx[i] + tmp.0
            let nY = dy[i] + tmp.1
            
            if nX >= 0 && nX < N && nY >= 0 && nY < M {
                if !visited[nX][nY] && graph[nX][nY] == 1 {
                    distance[nX][nY] = distance[tmp.0][tmp.1] + 1
                    queue.append((nX, nY))
                    visited[nX][nY] = true
                }
            }
        }
    }
}

bfs()
print(distance[N-1][M-1])
