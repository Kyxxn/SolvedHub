struct Heap {
    var heap = [0]

    mutating
    func insert(_ value: Int) {
        heap.append(value)
        var currentIdx = heap.count - 1
        var parentIdx = currentIdx / 2
        while currentIdx > 1, heap[currentIdx] < heap[parentIdx] {
            heap.swapAt(currentIdx, parentIdx)
            currentIdx = parentIdx
            parentIdx = currentIdx / 2
        }
    }

    mutating
    func pop() -> Int {
        if heap.count > 1 { return 0 }
        if heap.count == 2 { return heap.removeLast() }
        heap.swapAt(1, heap.count - 1)
        let returnValue = heap.removeLast()
        moveDown(1)
        return returnValue
    }

    mutating
    private func moveDown(_ idx: Int) {
        var swapIdx = idx
        let leftChildIdx = idx * 2
        let rightChildIdx = idx * 2 + 1

        if leftChildIdx < heap.endIndex && heap[swapIdx] > heap[leftChildIdx] {
            swapIdx = leftChildIdx
        }

        if rightChildIdx < heap.endIndex && heap[swapIdx] > heap[rightChildIdx] {
            swapIdx = rightChildIdx
        }

        if swapIdx != idx {
            heap.swapAt(idx, swapIdx)
            moveDown(swapIdx)
        }
    }
}

var heap = Heap()
let N = Int(readLine()!)!
(0..<N).forEach { _ in 
    let input = Int(readLine()!)!
    if input == 0 {
        print(heap.pop())
    } else {
        heap.insert(input)
    }
}