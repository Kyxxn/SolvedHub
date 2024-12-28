let N = Int(readLine()!)!

var input = Set<String>()
(0..<N).forEach { _ in 
    input.insert(readLine()!)
}

let sortedInput = input.sorted {
    if $0.count == $1.count {
        return $0 < $1
    }
    return $0.count < $1.count
}

sortedInput.forEach { print($0) }