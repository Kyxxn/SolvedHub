// 24년 겨울 알고리즘 스터디
// BOJ & 프로그래머스
//
// Created by 박효준 on 1/10/24.

import Foundation

let MN = readLine()!.split(separator: " ").map{Int(String($0))!}
let M = MN[0], N = MN[1]
var graph: [[Int]] = []
let mx = [0,0,-1,1], my = [-1,1,0,0]
for _ in 0..<N {
    let tomato: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph.append(tomato)
}

var day: [[Int]] = Array(repeating: Array(repeating: 0, count: M), count: N)
var queue: [(Int, Int)] = []
var alltomato = true
var lastIdx: (Int, Int) = (0,0)
var idx = 0
func bfs() {
    while idx < queue.count {
        let cur = queue[idx]
        idx += 1
        for i in 0..<4 {
            let nx = mx[i] + cur.0, ny = my[i] + cur.1
            if nx >= 0 && nx < N && ny >= 0 && ny < M {
                if graph[nx][ny] == 0 {
                    graph[nx][ny] = 1
                    day[nx][ny] = day[cur.0][cur.1] + 1
                    queue.append((nx,ny))
                    lastIdx = (nx, ny)
                }
            }
        }
    }
}

for i in 0..<N {
    for j in 0..<M {
        if graph[i][j] == 1 {
            queue.append((i,j))
        }
    }
}

bfs()

for i in 0..<N {
    for j in 0..<M {
        if graph[i][j] == 0 {
            alltomato = false
        }
    }
}

alltomato ? print(day[lastIdx.0][lastIdx.1]) : print(-1)
