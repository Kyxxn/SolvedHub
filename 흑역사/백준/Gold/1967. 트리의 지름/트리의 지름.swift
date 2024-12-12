//
//  BOJ_1967.swift
//  BOJ
//
//  Created by 박효준 on 1/10/24.
import Foundation

var n : Int = Int(readLine()!)!
var graph : [[(Int, Int)]] = Array(repeating: [(Int, Int)](), count: n+1)
var visited : [Bool] = Array(repeating: false, count: n+1)

for _ in 0..<n-1{ // 0~10 11번
    let tmp : [Int] = readLine()!.split(separator: " ").map{Int($0)!}
    let x : Int = tmp[0]
    let y : Int = tmp[1]
    let weight : Int = tmp[2]
    graph[x].append((y, weight))
    graph[y].append((x, weight))
}

var weightSum : Int = 0
var rootToleaf : [Int] = Array(repeating: 0, count : n+1)

func dfs(_ vertex : Int) {
    visited[vertex] = true
    
    for next in graph[vertex]{
        var nextVertex : Int = next.0
        var nextWeight : Int = next.1
        
        if (!visited[nextVertex]){
            weightSum = weightSum + nextWeight
            dfs(nextVertex)
            weightSum = weightSum - nextWeight
        }else{
            rootToleaf[vertex] = weightSum
        }
    }
}

dfs(1)
// 1번 : 루트와 가장 먼 리프노드
var weightMax : Int = rootToleaf.max()!
var start = rootToleaf.firstIndex(of: weightMax)!

// 2번 : 1번 노드와 가장 먼 리프노드
weightSum = 0
for i in 0...n{
    visited[i] = false
    rootToleaf[i] = 0
}
dfs(start)
weightMax = rootToleaf.max()!
print(weightMax)
//for i in rootToleaf{
//    print(i, terminator: " ")
//}

//for i in 0..<n{
//    print(graph[i])
//}



// **리프노드만 두 개를 골라야함**
// 1. 처음 DFS를 통해 루트와 가장 먼 리프노드를 고름
// 2. 1번 노드와 가장 거리가 먼 리프노드를 고름
