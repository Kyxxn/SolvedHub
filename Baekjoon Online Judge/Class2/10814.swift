struct Member: CustomStringConvertible {
    let age: Int
    let name: String
    var description: String {
        "\(age) \(name)"
    }
}
let N = Int(readLine()!)!
var array = [Member]()
(0..<N).forEach { i in
    let input = readLine()!.split(separator: " ")
    let member = Member(age: Int(input[0])!, name: String(input[1]))
    array.append(member)
}

print(array
.sorted { $0.age < $1.age }
.map { String($0.description) }
.joined(separator: "\n")
)