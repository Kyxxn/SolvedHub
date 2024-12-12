// 새로운 과제를 할 시간이 되면, 내려놓고 새 과제 시작
// 진행중이던 과제를 끝내면, 새로 시작할 과제를 미리 시작함
// 과제 끝난 상태에서 새로 시작한 과제 다 했고, 멈춘 과제가 있으면 멈춘 과제를 이어서 함
// 멈춘 과제가 여러 개일 경우, 가장 최근에 멈춘 과제부터 시작

import Foundation

func solution(_ plans:[[String]]) -> [String] {
    var answer: [String] = []
    var stack: [(String, Int, Int)] = [] // (할일, 남은시간)
    var task: [(String, Int, Int)] = [] // (할일, 시작시간, 남은시간)
    for plan in plans {
        let time: [Int] = plan[1].split(separator: ":").map{Int($0)!}
        task.append((plan[0], time[0] * 60 + time[1], Int(plan[2])!))
    }
    
    // popLast()를 사용하기 위해 내림차순으로 정렬 = 먼저 할 과제가 맨 뒤에 있음
    task.sort { $0.1 > $1.1 }
    
    // dropLast() = 마지막을 제거한 배열을 반환, 원본손상 X
    // popLast() = 마지막 원소만 반환, 원본손상 O, 없으면 nil
    // removeLast() = 마지막 원소만 반환, 원본손상 O, 없으면 컴파일 에러
    var curTask = task.popLast()!
    var curTime = curTask.1
    
    while !task.isEmpty {
        let nextTask = task.last!
        
        if curTime + curTask.2 == nextTask.1 { // 과제 끝난 시간 = 다음 할 일 시간
            answer.append(curTask.0)
            curTask = task.popLast()!
            curTime = curTask.1
        }else if curTime + curTask.2 > nextTask.1 { // 과제를 다 못하고, 다음 할 일 시작
            curTask.2 -= nextTask.1 - curTime
            stack.append(curTask)
            
            // 다음 과제 시작
            curTask = task.popLast()!
            curTime = curTask.1
        }else {
            // 과제 다 했는데 시간 남을 때
            answer.append(curTask.0)
            
            guard let remainTask = stack.popLast() else {
                // nil이면
                curTask = task.popLast()!
                curTime = curTask.1
                continue
            }
            curTime += curTask.2
            curTask = remainTask
        }
    }
    
    answer.append(curTask.0) // 마지막 시간의 과제

    for remainTask in stack.reversed() {
        answer.append(remainTask.0)
    }

    return answer
}
