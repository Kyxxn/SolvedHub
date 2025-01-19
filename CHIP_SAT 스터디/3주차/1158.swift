struct CircleQueue {
    var queue: [Int]
    var index = 0
    var k: Int

    init(array: [Int], k: Int) {
        self.queue = array
        self.k = k
    }

    mutating
    func remove() -> Int {
        index = (index + k - 1) % queue.count
        return queue.remove(at: index)
    }
}


let NK = readLine()!.split(separator: " ").map { (Int(String($0))!) }
let N = NK[0], K = NK[1]
var queue = CircleQueue(array: Array(1...N), k: K)
var result = [Int]()

while !queue.queue.isEmpty {
    result.append(queue.remove())
}

print("<" + result.map { String($0) }.joined(separator: ", ") + ">")