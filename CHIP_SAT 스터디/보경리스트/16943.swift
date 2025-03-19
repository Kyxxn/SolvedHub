let AB = readLine()!.split(separator: " ")
let (A, B) = (AB[0].map { String($0) }, Int(AB[1])!)

var used = Array(repeating: false, count: A.count)
var answer = -1

func dfs(_ depth: Int, _ str: String) {
    if depth == A.count {
        let num = Int(str)!
        if num < B {
            answer = max(answer, num)
        }
        return
    }

    for i in 0..<A.count where !used[i] {
        if depth == 0 && A[i] == "0" { continue }
        used[i] = true
        dfs(depth + 1, str + A[i])
        used[i] = false
    }
}

dfs(0, "")
print(answer)