let N = Int(readLine()!)!

var visitedDays = [Int]()
(0..<N).forEach { _ in 
    let input = Int(readLine()!)!
    visitedDays.append(input)
}

// 오름차순으로 들어옴, 그대로 반복문 ㄱ
var set = Set<Int>()
for visitedDay in visitedDays {
    var isRoutine = false
    for routine in set {
        if (visitedDay - 1) % routine == 0 {
            isRoutine = true
            break
        }
    }
    if !isRoutine && visitedDay != 1 {
        // 만약 집합 안에 들어 있으면 카운팅 안 해도 됨
        set.insert(visitedDay - 1)
    }
}

print(set.count)