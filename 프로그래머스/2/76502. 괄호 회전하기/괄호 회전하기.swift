// 0258 시작
// 0303 코드 작성
// 0329 테스트 13번 빼고 다 맞음
// 0339 테스트 13번이 스택 안에 빈 문자열이 있는 경우였음 -> 예외추가

import Foundation

func solution(_ s:String) -> Int {
    var count = 0
    var str = s
    let N = s.count
    
    for _ in 0..<N {
        // 괄호 검사
        var stack: [Character] = []
        var isValid = true        

        for char in str {
            if char == "(" || char == "{" || char == "[" {
                stack.append(char)
            }
            else {
                if stack.isEmpty {
                    isValid = false
                    break
                }
                
                let last = stack.removeLast()
                if (char == ")" && last != "(") ||
                    (char == "}" && last != "{") ||
                    (char == "]" && last != "[") {
                        isValid = false
                        break
                    }
            }
        }
        if isValid && stack.isEmpty {
            count += 1
        }
        
        // 괄호 이동
        str.append(str.removeFirst())
    }
    
    return count
}