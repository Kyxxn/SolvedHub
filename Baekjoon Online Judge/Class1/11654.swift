print(readLine()!.first!.asciiValue!)

// // 알파벳 대, 소문자 / 숫자 0~9
// // 정규식 쓰면 될듯 ?
// import Foundation

// let input = readLine()!
// let regex = #"[a-zA-Z0-9]{1}"#

// if let _ = input.range(of: regex, options: .regularExpression) {
//     if let asciiValue = input.unicodeScalars.first?.value {
//         print(asciiValue)
//     }
// }