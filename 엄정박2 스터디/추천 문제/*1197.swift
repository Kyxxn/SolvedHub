func findParent(_ index: Int) -> Int {
    if parent[index] == index {
        return index
    } else {
        parent[index] = findParent(parent[index])
        return parent[index]
    }
}

func unionParent(_ a: Int, _ b: Int) {
    let num1 = findParent(a)
    let num2 = findParent(b)
    if num1 < num2 {
        parent[num2] = num1
    } else {
        parent[num1] = num2
    }
}

let VE = readLine()!.split(separator: " ").map { Int($0)! }
let V = VE[0], E = VE[1]
var parent = Array(0...V)

var graph = [[Int]]()
var count = 0
var result = 0

(0..<E).forEach { _ in 
    let ABC = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(ABC)
}
graph.sort { $0[2] < $1[2] }

for (idx, _) in graph.enumerated() {
    if count == V - 1 { break }

    if findParent(graph[idx][0]) != findParent(graph[idx][1]) {
        result += graph[idx][2]
        count += 1
        unionParent(graph[idx][0], graph[idx][1])
    }
}

print(result)