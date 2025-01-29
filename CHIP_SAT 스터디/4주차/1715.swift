struct Heap {
    var heap = [0]

    mutating
    func insert(_ value: Int) {
        heap.append(value)
        var currentIndex = heap.count - 1
        var parentIndex = currentIndex / 2
        while currentIndex > 1 && heap[currentIndex] < heap[parentIndex] {
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
        let leftChildIndex = 2 * index
        let rightChildIndex = 2 * index + 1
        var swapIndex = index

        if leftChildIndex < heap.endIndex && heap[leftChildIndex] < heap[swapIndex] {
            swapIndex = leftChildIndex
        }

        if rightChildIndex < heap.endIndex && heap[rightChildIndex] < heap[swapIndex] {
            swapIndex = rightChildIndex
        }

        if swapIndex != index {
            heap.swapAt(swapIndex, index)
            moveDown(swapIndex)
        }
    }
}

let N = Int(readLine()!)!
var heap = Heap()

(0..<N).forEach { _ in 
    heap.insert(Int(readLine()!)!)
}

var result = 0
while heap.heap.count > 2 {
    let minCardDeck1 = heap.pop()
    let minCardDeck2 = heap.pop()
    let cycle = minCardDeck1 + minCardDeck2
    result += cycle
    heap.insert(cycle)
}

print(result)