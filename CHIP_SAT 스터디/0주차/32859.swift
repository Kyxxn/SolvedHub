struct Member {
    var isForm: Bool
    var isDeposit: Bool
    var overCount: Int
}

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0], M = NM[1]
let S = Int(readLine()!)!

var members = Array(repeating: Member(isForm: false, isDeposit: false, overCount: S), count: N)
var formCountAfterDeposit = [Int](repeating: 0, count: N) // 각 회원이 입금 후 몇 명이 폼을 제출했는지 기록
var result = [Int]()

for _ in 0..<M {
    let it = readLine()!.split(separator: " ").map { Int(String($0))! }
    let i = it[0] - 1, t = it[1]

    if t == 0 { // 폼 제출
        members[i].isForm = true

        for j in 0..<N {
            if members[j].isDeposit && !members[j].isForm {
                formCountAfterDeposit[j] += 1
                if formCountAfterDeposit[j] >= S {
                    result.append(j + 1)
                    members[j].isForm = true // 이미 탈락해서 폼제출 처리
                }
            }
        }
    } else if t == 1 { // 입금 완료
        members[i].isDeposit = true
    }
}

if !result.isEmpty {
    result.sorted().forEach { i in print(i) }
} else {
    print(-1)
}
