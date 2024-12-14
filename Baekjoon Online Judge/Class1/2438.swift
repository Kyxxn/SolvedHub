/// 억지로 ForEach로 풀어보기
/// 0..<input을 괄호로 안 묶으면 input.forEach로 인식해버려서 에러 뜸

// 최초 정답 코드
// let input = Int(readLine()!)!
// var star = "*"

// (0..<input).forEach { _ in
//     print(star)
//     star += "*"
// }

let input = Int(readLine()!)!

(1...input).forEach { i in
    print(String(repeating: "*", count: i))
}