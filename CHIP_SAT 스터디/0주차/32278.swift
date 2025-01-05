// 시작 - 22:06
// short 끝 - 22:30
// 첫 번째 제출 14% 틀림 - 22:36
// 0 예외처리 - 22:40
// 현실자각 - 22:46

var input = Int(readLine()!)!
let minusShortStandard = Int16.min // 5글자
let plusShortStandard = Int16.max // 5글자
let minusIntStandard = Int32.min // 10글자
let plusIntStandard = Int32.max // 10글자

if Int(minusShortStandard) <= input && input <= Int(plusShortStandard) {
    print("short")
} else if Int(minusIntStandard) <= input && input <= Int(plusIntStandard) {
    print("int")
} else {
    print("long long")
}