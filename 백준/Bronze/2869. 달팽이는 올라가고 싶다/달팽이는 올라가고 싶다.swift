// 04:18 시작
// 04:22 1차 끝 - 시간초과
// 04:48 끝

import Foundation

let ABV = readLine()!.split(separator: " ").map { Double(String($0))! }
print(Int(ceil((ABV[2] - ABV[1]) / (ABV[0] - ABV[1]))))
