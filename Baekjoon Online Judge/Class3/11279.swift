struct Heap {
    var heap = [0]

    mutating
    func insert(_ value: Int) {
        heap.append(value)
        var currentIndex = heap.count - 1
        var parentIndex = currentIndex / 2
        while currentIndex > 1 && heap[currentIndex] > heap[parentIndex] {
            heap.swapAt(currentIndex, parentIndex)
            currentIndex = parentIndex
            parentIndex = currentIndex / 2
        }
    }

    mutating
    func pop() -> Int {
        guard heap.count > 1 else { return 0 }
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


let N = Int(readLine()!)!
var heap = Heap()

(0..<N).forEach { _ in 
    let input = Int(readLine()!)!
    if input == 0 {
        print(heap.pop())
    } else {
        heap.insert(input)
    }
}