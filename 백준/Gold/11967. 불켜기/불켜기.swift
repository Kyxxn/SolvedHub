// 24년 겨울 알고리즘 스터디
// BOJ & 프로그래머스
//
// Created by 박효준 on 1/10/24.
// 15:05 시작

import Foundation

struct IntPair: Hashable {
    var x: Int
    var y: Int
}

var input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]

var moveX: [Int] = [0, 0, 1, -1]
var moveY: [Int] = [-1, 1, 0, 0]
var graph: [[[(Int, Int)]]] = Array(repeating: Array(repeating: [], count: N+1), count: N+1)
var lightOnRoom: [[Bool]] = Array(repeating: Array(repeating: false, count: N+1), count: N+1)
var lightCount: Set<IntPair> = []
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: N+1), count: N+1)

for _ in 0..<M {
    input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let x = input[0], y = input[1], a = input[2], b = input[3]
    graph[x][y].append((a,b))
}

func DFS(_ V: (Int, Int)) {
    // 방 불 켜기
    let x = V.0, y = V.1
    
    if visited[x][y] { return }
    visited[x][y] = true
    
    for i in 0..<graph[x][y].count {
        let lightX = graph[x][y][i].0, lightY = graph[x][y][i].1
        if !lightOnRoom[lightX][lightY] {
            lightOnRoom[lightX][lightY] = true
            lightCount.insert(IntPair(x: lightX, y: lightY))
            
            // 다시 방문 필요 체크
            for i in 0..<4 {
                let tmpX = lightX + moveX[i], tmpY = lightY + moveY[i]
                if tmpX > 0 && tmpY > 0 && tmpX <= N && tmpY <= N && visited[tmpX][tmpY] {
                    DFS((lightX, lightY))
                }
            }
        }
    }
    
    // 불 켜져있는 다음 방 방문
    for i in 0..<4 {
        let tmpX = x + moveX[i], tmpY = y + moveY[i]
        
        if tmpX > 0 && tmpY > 0 && tmpX < N + 1 && tmpY < N + 1 && !visited[tmpX][tmpY] && lightOnRoom[tmpX][tmpY]{
            DFS((tmpX, tmpY))
        }
    }
}


DFS((1,1))
lightCount.insert(IntPair(x: 1, y: 1))

print(lightCount.count)
