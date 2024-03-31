// 16분: (0,0)과 (x,y)의 두 점 사이의 거리가 d가 넘으면 안됨
// 22분: 백트래킹이란 생각이 듬
// 28분: 일단 이중 for 써봄
// 35분: 테케 맞음 -> 제출하니 12/16 (4개 시간초과)
// 43분: 최적화 했으나 계속 테케 (8, 11, 13, 14)에서 시간 초과 -> 남의 코드 보기 시작

import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {
    var count: Int64 = 0
    let limit = d * d
    
    // from: 0부터, to: d까지
    for i in stride(from: 0, to: d+1, by: k) {
        if i > d { break }
        let standard = i * i
        let powMargin = Int64(sqrt(Double(limit - standard))) / Int64(k) + 1
        count += powMargin
    }
    
    return count
}

    // for i in stride(from: 0, to: d+1, by: k) {
    //     let standard = (i * i)
    //     for j in stride(from: 0, to: d+1, by: k) {
    //         if limit < standard + (j * j) {
    //             continue
    //         }
    //         count += 1
    //     }
    // }