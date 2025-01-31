struct Heap<T> {
    var heap = [T]()
    private let cmp: (T, T) -> Bool

    var top: T? { heap.first }
    var isEmpty: Bool { heap.isEmpty }
    var size: Int { heap.count }

    init(cmp: @escaping (T, T) -> Bool) {
        self.cmp = cmp
    }

    mutating func insert(_ value: T) {
        heap.append(value)
        var currentIndex = heap.count - 1
        while currentIndex > 0 {
            let parentIndex = (currentIndex - 1) / 2
            if cmp(heap[currentIndex], heap[parentIndex]) {
                heap.swapAt(currentIndex, parentIndex)
                currentIndex = parentIndex
            } else {
                break
            }
        }
    }

    mutating func pop() -> T? {
        guard !heap.isEmpty else { return nil }
        if heap.count == 1 { return heap.removeLast() }
        heap.swapAt(0, heap.count - 1)
        let returnValue = heap.removeLast()
        
        var index = 0
        while true {
            let left = index * 2 + 1
            let right = left + 1
            var swapIndex = index

            if left < heap.count && cmp(heap[left], heap[swapIndex]) {
                swapIndex = left
            }

            if right < heap.count && cmp(heap[right], heap[swapIndex]) {
                swapIndex = right
            }

            if swapIndex == index { break }
            heap.swapAt(swapIndex, index)
            index = swapIndex
        }

        return returnValue
    }
}

let T = Int(readLine()!)!
for _ in 0..<T {
    let M = Int(readLine()!)!
    var input = [Int]()
    while input.count < M {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        input.append(contentsOf: line)
    }
    
    var minHeap = Heap<Int>(cmp: <)
    var maxHeap = Heap<Int>(cmp: >)
    var result = [Int]()
    
    for (index, value) in input.enumerated() {
        minHeap.insert(value)
        maxHeap.insert(minHeap.pop()!)
        if maxHeap.size > minHeap.size {
            minHeap.insert(maxHeap.pop()!)
        }
        
        if index % 2 == 0 {
            result.append(minHeap.top!)
        }
    }
    
    print(result.count)
    print(result.map { String($0) }.joined(separator: " "))
}