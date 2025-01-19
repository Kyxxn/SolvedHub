struct Queue {
    var queue = [Int]()
    var index = 0
    var size: Int

    init(size: Int) {
        self.size = size
    }

    mutating
    func enque(_ value: Int) {
        guard queue.count < size else { return }
        queue.append(value)
    }

    mutating
    func deque() -> Int {
        let returnValue = queue[index]
        index += 1
        size += 1

        return returnValue
    }
}

let N = Int(readLine()!)!
var queue = Queue(size: N)

while let input = readLine() {
    guard input != "-1" else { break }

    if input == "0" {
        queue.deque()
    } else {
        queue.enque(Int(input)!)
    }
}

if queue.index == queue.queue.count {
    print("EMPTY")
} else {
    for i in queue.index..<queue.queue.count {
        print(queue.queue[i], terminator: " ")
    }
}