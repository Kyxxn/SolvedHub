struct Quiz {
    let name: Int
    let level: Int

    init(_ name: Int, _ level: Int) {
        self.name = name
        self.level = level
    }
}

struct MinHeap {
    var heap: [Quiz] = [Quiz(0, 0)]
    var top: Int { heap[1].name }

    mutating
    func insert(_ quiz: Quiz) {
        heap.append(quiz)
        var currentIndex = heap.count - 1
        var parentIndex = currentIndex / 2
        while currentIndex > 1, heap[currentIndex].level <= heap[parentIndex].level {
            if heap[currentIndex].level == heap[parentIndex].level {
                if heap[currentIndex].name < heap[parentIndex].name {
                    heap.swapAt(currentIndex, parentIndex)
                }
            } else {
                heap.swapAt(currentIndex, parentIndex)
            }
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

        return returnValue.name
    }

    mutating
    func moveDown(_ index: Int) {
        let leftChildIndex = 2 * index
        let rightChildIndex = 2 * index + 1
        var swapIndex = index
        
        if leftChildIndex < heap.endIndex && heap[swapIndex].level >= heap[leftChildIndex].level {
            if heap[swapIndex].level == heap[leftChildIndex].level {
                if heap[swapIndex].name > heap[leftChildIndex].name {
                    swapIndex = leftChildIndex
                }
            } else {
                swapIndex = leftChildIndex
            }
        }

        if rightChildIndex < heap.endIndex && heap[swapIndex].level >= heap[rightChildIndex].level {
            if heap[swapIndex].level == heap[rightChildIndex].level {
                if heap[swapIndex].name > heap[rightChildIndex].name {
                    swapIndex = rightChildIndex
                }
            } else {
                swapIndex = rightChildIndex
            }
        }

        if swapIndex != index {
            heap.swapAt(swapIndex, index)
            moveDown(swapIndex)
        }
    }
}

struct MaxHeap {
    var heap: [Quiz] = [Quiz(0, 0)]
    var top: Int { heap[1].name }

    mutating
    func insert(_ quiz: Quiz) {
        heap.append(quiz)
        var currentIndex = heap.count - 1
        var parentIndex = currentIndex / 2
        while currentIndex > 1, heap[currentIndex].level >= heap[parentIndex].level {
            if heap[currentIndex].level == heap[parentIndex].level {
                if heap[currentIndex].name > heap[parentIndex].name {
                    heap.swapAt(currentIndex, parentIndex)
                }
            } else {
                heap.swapAt(currentIndex, parentIndex)
            }
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

        return returnValue.name
    }

    mutating
    func moveDown(_ index: Int) {
        let leftChildIndex = 2 * index
        let rightChildIndex = 2 * index + 1
        var swapIndex = index
        
        if leftChildIndex < heap.endIndex && heap[swapIndex].level <= heap[leftChildIndex].level {
            if heap[swapIndex].level == heap[leftChildIndex].level {
                if heap[swapIndex].name < heap[leftChildIndex].name {
                    swapIndex = leftChildIndex
                }
            } else {
                swapIndex = leftChildIndex
            }
        }

        if rightChildIndex < heap.endIndex && heap[swapIndex].level <= heap[rightChildIndex].level {
            if heap[swapIndex].level == heap[rightChildIndex].level {
                if heap[swapIndex].name < heap[rightChildIndex].name {
                    swapIndex = rightChildIndex
                }
            } else {
                swapIndex = rightChildIndex
            }
        }

        if swapIndex != index {
            heap.swapAt(swapIndex, index)
            moveDown(swapIndex)
        }
    }
}


var minHeap = MinHeap()
var maxHeap = MaxHeap()
var solvedDict = [Int: Int]()

let N = Int(readLine()!)!
(0..<N).forEach { _ in
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let quiz = Quiz(input[0], input[1])
    minHeap.insert(quiz)
    maxHeap.insert(quiz)
}

let M = Int(readLine()!)!
(0..<M).forEach { _ in
    let input = readLine()!.split(separator: " ").map { String($0) }
    let cmd = input[0]

    switch cmd {
    case "add":
        let quiz = Quiz(Int(input[1])!, Int(input[2])!)
        minHeap.insert(quiz)
        maxHeap.insert(quiz)
    case "recommend":
        let recommendCMD = Int(input[1])
        if recommendCMD == 1 {
            while maxHeap.heap.count > 1 && (solvedDict[maxHeap.top, default: 0] > 0) {
                solvedDict[maxHeap.top, default: 0] -= 1
                maxHeap.pop()
            }
            if maxHeap.heap.count > 1 {
                print(maxHeap.top)
            }
        } else {
        while minHeap.heap.count > 1 && (solvedDict[minHeap.top, default: 0] > 0) {
                solvedDict[minHeap.top, default: 0] -= 1
                minHeap.pop()
            }
            if minHeap.heap.count > 1 {
                print(minHeap.top)
            }
        }
    case "solved":
        solvedDict[Int(input[1])!, default: 0] += 1
    default: break
    }
}