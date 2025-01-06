let N = Int(readLine()!)!
var inputMap = [String: Int]()
var ringNameMap = [String: String]()
var result = [String]()
var count = 0
(0..<N).forEach { _ in 
    let input = readLine()!.split(separator: " ").map { String($0) }
    let name = input[0], ring = input[1]
    inputMap[ring, default: 0] += 1
    ringNameMap[ring, default: ""] += "\(name) "
}

for (key, value) in inputMap {
    if value == 2, key != "-" {
        result.append(ringNameMap[key]!)
        count += 1
    }
}

print(count)
print(result.joined(separator: "\n"))