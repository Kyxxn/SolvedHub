// 시작 1220
// 문제이해 1221
// 스택쓰자 -> 1229
// 무지성 실버5급 문제라 생각하고 1차 제출 1244

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0], K = NK[1]
let A = readLine()!.split(separator: " ").map { Int($0)! }

var mainStack = [Int]()
var notCount = 0
var maxL = 0

for (idx, a) in A.enumerated() {
    mainStack.append(a)
    for j in idx+1..<N {
        if !mainStack.isEmpty && mainStack.last! == A[j] {
            mainStack.append(A[j])
        } else {
            if notCount < K { // K개 만큼 빼지 않은 경우
                notCount += 1
            } else { // K개만큼 빼버려서 L을 측정해야 함
                maxL = max(maxL, mainStack.count)
                mainStack = [Int]()
                notCount = 0
                break
            }
        }
    }
    maxL = max(maxL, mainStack.count)
    mainStack = [Int]()
    notCount = 0
}
print(maxL)