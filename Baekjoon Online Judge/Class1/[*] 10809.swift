let input = readLine()!.map { $0.asciiValue! }
let result = (97...122).map { input.firstIndex(of: $0) ?? -1 }
result.forEach { print($0, terminator: " ") }
