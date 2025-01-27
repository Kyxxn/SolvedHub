// 맥스 힙
struct PriorityQueue {
    var heap = [0]
    var isEmpty: Bool { heap.count == 1 }

    mutating
    func insert(_ value: Int) {
        heap.append(value)
        var currentIndex = heap.count - 1
        var parentIndex = currentIndex / 2
        while currentIndex > 1, heap[currentIndex] > heap[parentIndex] {
            heap.swapAt(currentIndex, parentIndex)
            currentIndex = parentIndex
            parentIndex = currentIndex / 2
        }
    }

    mutating
    func pop() -> Int {
        heap.swapAt(1, heap.count - 1)
        let returnValue = heap.removeLast()
        moveDown(1)

        return returnValue
    }

    mutating
    func moveDown(_ index: Int) {
        let leftChildIndex = index * 2
        let rightChildIndex = index * 2 + 1
        var swapIndex = index

        if leftChildIndex < heap.endIndex && heap[leftChildIndex] > heap[swapIndex] {
            swapIndex = leftChildIndex
        }

        if rightChildIndex < heap.endIndex && heap[rightChildIndex] > heap[swapIndex] {
            swapIndex = rightChildIndex
        }

        if swapIndex != index {
            heap.swapAt(swapIndex, index)
            moveDown(swapIndex)
        }
    }
}

let NMK = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = NMK[0], M = NMK[1], K = NMK[2]
var heap = PriorityQueue()

(0..<N).forEach { _ in
    heap.insert(Int(readLine()!)!)
}

var count = 0
var Y = 0
var result = [Int]()
while !heap.isEmpty {
    count += 1
    let popTask = heap.pop()
    let newTask = popTask - M
    if newTask > K {
        heap.insert(newTask)
    }
    let newY = (Y / 2) + popTask
    Y = newY
    result.append(Y)
}

print(count)
print(result.map { String($0) }.joined(separator: "\n"))