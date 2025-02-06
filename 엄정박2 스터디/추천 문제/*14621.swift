func findParent(_ index: Int) -> Int {
    if parents[index] == index {
        return index
    } else { 
        parents[index] = findParent(parents[index])
        return parents[index]
    }
}

func unionParent(_ a: Int, _ b: Int) {
    let num1 = findParent(a)
    let num2 = findParent(b)
    if num1 < num2 {
        parents[num2] = parents[num1]
    } else {
        parents[num1] = parents[num2]
    }
}

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]
let input = readLine()!.split(separator: " ").map { String($0) }

var parents = Array(0...N)
var graph = [(Int, Int, Int)]()
(0..<M).forEach { _ in 
    let uvd = readLine()!.split(separator: " ").map { Int($0)! }
    let u = uvd[0], v = uvd[1], d = uvd[2]
    graph.append((u, v, d))
}
graph.sort { $0.2 < $1.2 }

// 가중치 대로 정렬했으니까, 뽑으면서 싸이클 생기는지 판단하기
// V - 1개 되면 멈춤
var count = 0
var result = 0
var isVisit = Array(repeating: false, count: N + 1)
isVisit[0] = true

for (index, edgeInfo) in graph.enumerated() {
    if input[edgeInfo.0 - 1] == input[edgeInfo.1 - 1] {
        continue
    }

    if count == N - 1 {
        break
    }

    // 부모 같은 지 검증, 다르면 사이클 안 생김
    if findParent(graph[index].0) != findParent(graph[index].1) {
        isVisit[graph[index].0] = true
        isVisit[graph[index].1] = true
        result += graph[index].2
        count += 1
        unionParent(graph[index].0, graph[index].1)
    }
}

var isFinish = true
for info in isVisit {
    if !info {
        isFinish = false
        break
    }
}

print(isFinish ? result : -1)