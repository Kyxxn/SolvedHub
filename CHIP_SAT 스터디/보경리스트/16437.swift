func dfs(_ vertex: Int) -> Int {
    var total = 0
    
    for child in sums[vertex] {
        total += dfs(child)
    }

    if isSheep[vertex] {
        total += counts[vertex]
    } else {
        total -= counts[vertex]
    }

    return max(0, total)
}

let N = Int(readLine()!)!
var sums = Array(repeating: [Int](), count: N + 1)
var isSheep = Array(repeating: false, count: N + 1)
var counts = Array(repeating: 0, count: N + 1)

(2...N).forEach { index in
    let input = readLine()!.split(separator: " ").map { String($0) }
    let (t, a, p) = (input[0], Int(input[1])!, Int(input[2])!)
    
    isSheep[index] = (t == "S")
    counts[index] = a
    sums[p].append(index)
}

print(dfs(1))