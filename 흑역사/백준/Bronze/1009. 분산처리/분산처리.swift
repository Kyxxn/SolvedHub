// 00:43 시작
// 01:00 끝

import Foundation

// 컴퓨터 10개에 번호 부여
// 1번 데이터는 1번, 11번 데이터는 1번 %10 연산자 예상

let T = Int(readLine()!)!
for _ in 0..<T {
    let ab = readLine()!.split(separator: " ").map {Int(String($0))!}
    let a = ab[0]
    let b = ab[1]
    var result = 1
    
    for _ in 0..<b {
        result *= a
        result %= 10
    }
    if result == 0 {
        print(10)
    } else {
        print(result)
    }
}
