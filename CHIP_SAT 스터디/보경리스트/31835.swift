// 1126 시작

func dfs(_ idx: Int, _ currentMember: [(Int, Int)]) {
    if isFinish { return }

    if currentMember.count == P {
        let minSum = currentMember.map { $0.0 }.reduce(0, +)
        let maxSum = currentMember.map { $0.1 }.reduce(0, +)

        var result = Array(repeating: 0, count: N)
        if rec(0, currentMember, 0, minSum, &result) {
            answer = result
            isFinish = true
        }
        return
    }

    if idx < N {
        dfs(idx + 1, currentMember + [members[idx]])
        dfs(idx + 1, currentMember) // 현재 회원 미 포함
    }
}

func rec(_ idx: Int, _ currentMember: [(Int, Int)], _ sum: Int, _ minSum: Int, _ result: inout [Int]) -> Bool {
    if isFinish { return true }

    if idx == P { 
        return sum == E
    }

    let (xi, yi) = currentMember[idx]

    for num in xi...yi {
        if sum + num > E { break }

        result[members.firstIndex(where: { $0 == currentMember[idx] })!] = num
        if rec(idx + 1, currentMember, sum + num, minSum, &result) {
            return true
        }
    }

    return false
}

let NPE = readLine()!.split(separator: " ").map { Int($0)! }
let N = NPE[0], P = NPE[1], E = NPE[2]

var members = [(Int, Int)]()
(0..<N).forEach { _ in
    let XY = readLine()!.split(separator: " ").map { Int($0)! }
    members.append((XY[0], XY[1]))
}

var answer = [Int]()
var isFinish = false

dfs(0, [])

answer.isEmpty
? print(-1)
: print(answer.map { String($0) }.joined(separator: " "))