struct CircleQueue {
    var queue: [Int]
    var cards: [Int]
    var index = 0

    init(array: [Int], cards: [Int]) {
        self.queue = array
        self.cards = cards
    }
    
    mutating
    func dequeue() -> Int {
        let removeValue = queue[index]
        let moveValue = cards[index]
        queue.remove(at: index)
        cards.remove(at: index)
        
        if queue.isEmpty { return removeValue }
        
        if moveValue > 0 {
            index = (index + (moveValue - 1)) % queue.count
        } else {
            index = (index + moveValue) % queue.count
            if index < 0 {
                index += queue.count
            }
        }
        
        return removeValue
    }
}

let N = Int(readLine()!)!
let ballons = readLine()!.split(separator: " ").map { Int($0)! }

var queue = CircleQueue(array: Array(1...N), cards: ballons)
var result = [Int]()
while queue.queue.count > 0 {
    result.append(queue.dequeue())
}
print(result.map { String($0) }.joined(separator: " "))