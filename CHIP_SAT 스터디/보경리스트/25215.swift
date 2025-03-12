// 1350 시작

let input = readLine()!

var answer = input.count
var count = 0
var chars = Array(input)

for i in 0..<chars.count {
    let currentChar = chars[i]

    if currentChar.isUppercase {
        if count == 0 {
            answer += 1
        }
        count += 1
    } else { //소문자
        if count > 1 {
            answer += 1 // 마름모 해제
            if i < chars.count - 1 {
                let next = chars[i + 1]
                if next.isLowercase {
                    count = 0
                }
            }
        } else if count == 1 {
            count = 0
        }
    }
}

print(answer)