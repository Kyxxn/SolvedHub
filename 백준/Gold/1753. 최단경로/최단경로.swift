// 19:45

import Foundation

struct PriorityHeap<T: Comparable> {
    var priorityHeap = [T]()
    
    private func getParent(_ index: Int) -> Int {
        return index / 2
    }
    
    private func getLeftChild(_ index: Int) -> Int {
        return index * 2
    }
    
    private func getRightChild(_ index: Int) -> Int {
        return index * 2 + 1
    }
    
    func isEmpty() -> Bool {
        return priorityHeap.count <= 1
    }
    
    mutating func push(_ data: T) {
        if priorityHeap.isEmpty {
            priorityHeap.append(data)
        }
        priorityHeap.append(data)
        var index = priorityHeap.count - 1
        
        while index > 1 {
            let parentIndex = getParent(index)
            let parent = priorityHeap[parentIndex]
            guard parent > data else { break }
            priorityHeap[index] = parent
            index = parentIndex
        }
        priorityHeap[index] = data
    }
    
    mutating func pop() -> T? {
        guard !isEmpty() else { return nil }
        let item = priorityHeap[1]
        let data = priorityHeap.removeLast()
        
        if !isEmpty() {
            var (parent, child) = (1, getLeftChild(1))
            while child < priorityHeap.count {
                if child + 1 < priorityHeap.count &&
                    priorityHeap[child] > priorityHeap[child + 1] {
                    child += 1 // 오른쪽 자식
                }
                guard data > priorityHeap[child] else { break }
                priorityHeap[parent] = priorityHeap[child]
                parent = child
                child = getLeftChild(parent)
            }
            priorityHeap[parent] = data
        }
        return item
    }
}

struct Node: Comparable {
    let node: Int
    let cost: Int
    
    init(_ node: Int, _ cost: Int) {
        self.node = node
        self.cost = cost
    }
    
    static func < (lhs: Node, rhs: Node) -> Bool {
        lhs.cost < rhs.cost
    }
}

let VE = readLine()!.split(separator: " ").map { Int($0)! }
let V = VE[0], E = VE[1]
let K = Int(readLine()!)!
var graph = [Int: [Node]]()
var result = Array(repeating: Int.max, count: V + 1)
for i in 1...V {
    graph[i] = []
}

for _ in 0..<E {
    let uvw = readLine()!.split(separator: " ").map { Int($0)! }
    let (start, end, cost) = (uvw[0], uvw[1], uvw[2])
    graph[start]!.append(Node(end, cost))
}

func dijkstra(_ start: Int) {
    var queue = PriorityHeap<Node>()
    var visited = [Bool](repeating: false, count: V + 1)
    result[start] = 0
    queue.push((Node(K, 0)))

    while let current = queue.pop() {
        let (node, cost) = (current.node, current.cost)
        guard !visited[node] else { continue }
        visited[node] = true
        if let edge = graph[node] {
            for next in edge {
                let (nextNode, nextCost) = (next.node, next.cost)
                guard !visited[nextNode] else { continue }
                let newCost = cost + nextCost
                if newCost < result[nextNode] {
                    result[nextNode] = newCost
                    queue.push(Node(nextNode, newCost))
                }
            }
        }
    }
}

dijkstra(K)
for i in 1...V {
    print(result[i] == Int.max ? "INF" : result[i])
}
