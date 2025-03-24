struct Queue {
    var queue = [Int]()
    var index = 0
    var isEmpty: Bool { queue.count == index }
    var first: Int { queue[index] }
    var last: Int { queue[queue.count - 1] }
    var count: Int { queue.count - index }

    mutating
    func enqueue(_ value: Int) {
        queue.append(value)
    }

    mutating
    func dequeue() -> Int {
        let returnValue = queue[index]
        index += 1

        return returnValue
    }
}

var array = Queue()
let N = Int(readLine()!)!
(0..<N).forEach { _ in
    let input = readLine()!.split(separator: " ").map { String($0) }
    switch input[0] {
        case "push": array.enqueue(Int(input[1])!)
        case "front": print(array.isEmpty ? "-1" : array.first)
        case "back": print(array.isEmpty ? "-1" : array.last)
        case "size": print(array.count)
        case "empty": print(array.isEmpty ? "1" : "0")
        case "pop": print(array.isEmpty ? "-1" : array.dequeue())
        default: break
    }
}