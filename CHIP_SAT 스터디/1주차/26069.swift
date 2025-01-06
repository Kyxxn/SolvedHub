let N = Int(readLine()!)!
var set: Set<String> = ["ChongChong"]
(0..<N).forEach { _ in 
    let input = readLine()!.split(separator: " ").map { String($0) }
    let currentName = input[0], meetName = input[1]

    if set.contains(currentName) || set.contains(meetName) {
        set.insert(currentName)
        set.insert(meetName)
    }
}

print(set.count)