// 19:04 시작
// 19:29 2차원 행렬 완성
// 19:45 Int64 vs Int 해결, 시간초과
// 19:51 행렬 치움

import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {  
    var answer: [Int] = []
    
    for i in left...right {
        let row = Int(i / Int64(n))
        let col = Int(i % Int64(n))
        
        answer.append(max(row, col) + 1)
    }
    
    return answer
}

//     var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
//     matrix[0][0] = 1
    
//     for i in 1..<n {
//         if i+1 <= n {
//             // 위
//             for j in 0..<i {
//                 matrix[i][j] = i+1
//             }
            
//             // 아래
//             for j in 0..<i {
//                 matrix[j][i] = i+1
//             }
            
//             // 오른 대각
//             matrix[i][i] = i + 1
//         }
//     }
    
//     var answer: [Int] = []
//     var row: Int = Int(left / Int64(n))
    
//     for i in left...right {
//         let idx: Int = Int(i % Int64(n))
//         if Int(i / Int64(n)) != row {
//             row += 1
//         }
        
//         answer.append(matrix[row][idx])
//     }