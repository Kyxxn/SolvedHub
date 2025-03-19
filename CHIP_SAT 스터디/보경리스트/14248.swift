// 5
// 1 4 2 2 1
// 3

// 5

let n = Int(readLine()!)!
var input = [0]
input = input + readLine()!.split(separator: " ").map { Int($0)! }
let s = Int(readLine()!)!

// 3에서 시작하면 2니까 -2, 2
// 3 1 2 5 4
var set = Set<Int>()
func dfs(_ index: Int) {
    let plusMove = input[index]
    let minusMove = -input[index]
    set.insert(index)

    if index + plusMove <= n && !set.contains(index + plusMove) {
        dfs(index + plusMove)
    }

    if index + minusMove >= 1 && !set.contains(index + minusMove) {
        dfs(index + minusMove)
    }
}

dfs(s)
print(set.count)