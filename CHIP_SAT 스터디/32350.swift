import Foundation

let NDp = readLine()!.split(separator: " ").map { Int($0)! }
let N = NDp[0], D = NDp[1], p = NDp[2]
var M = readLine()!.split(separator: " ").map { Int($0)! }

var pointer = 0
var result = 0

while pointer < N {
    let standard = M[pointer]
    let currentValue = standard - D
    
    if currentValue < 0 { // 오버킬한 경우
        M[pointer] = 0

        if pointer + 1 < N {
            let additionalValue = abs(currentValue) * p / 100
            print(type(of: abs(currentValue)))
            print(type(of: p / 100))
            print(type(of: abs(currentValue) * p / 100))
            M[pointer + 1] -= additionalValue
            if M[pointer + 1] <= 0 {
                M[pointer + 1] = 0
                pointer += 1
            }
        }
        pointer += 1
    } else {
        M[pointer] -= D
        if M[pointer] == 0 {
            pointer += 1
        }
    }
    result += 1
}

print(result)