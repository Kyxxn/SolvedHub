let N = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { String($0) }
var map = [String: Int]()

var result = 0
for (idx, mahjong) in input.enumerated() {
    map[mahjong, default: 0] += 1
    if map[mahjong]! > 4 {
        result = idx + 1
        break
    }
}

print(result == 0 ? "0" : result)