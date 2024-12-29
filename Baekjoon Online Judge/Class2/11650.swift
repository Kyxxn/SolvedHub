struct Position: CustomStringConvertible {
    let x: Int
    let y: Int
    var description: String {
        "\(x) \(y)"
    }
}

let N = Int(readLine()!)!
var array = [Position]()
(0..<N).forEach { i in
    let input = readLine()!.split(separator:  " ").map { Int($0)!} 
    array.append(Position(x: input[0], y: input[1]))
}
print(array.sorted {
    if $0.x == $1.x {
        return $0.y < $1.y
    }
    return $0.x < $1.x
}.map { String($0.description) }.joined(separator: "\n"))