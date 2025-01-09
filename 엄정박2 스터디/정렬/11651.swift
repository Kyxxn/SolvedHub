let N = Int(readLine()!)!
var array = [(Int, Int)]()

(0..<N).forEach { _ in 
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    array.append((input[0], input[1]))
}

array.sort {
    if $0.1 == $1.1 {
        return $0.0 < $1.0
    }
    return $0.1 < $1.1
}

array.forEach { 
    print("\($0.0) \($0.1)")
}