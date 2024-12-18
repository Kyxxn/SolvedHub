let input = readLine()!.split(separator: " ").map { Int($0)! }
let hour = input[0]
let min = input[1]

if hour == 0 && min < 45 {
    print("23 \(60 + min - 45)")
} else if min < 45 {
    print("\(hour - 1) \(60 + min - 45)")
} else {
    print("\(hour) \(min - 45)")
}