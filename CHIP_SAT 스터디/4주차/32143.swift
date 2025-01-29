struct Heap {
    var heap = [0]
    var top: Int { heap.count > 1 ? heap[1] : 0 }
    var size: Int { return heap.count - 1 }

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

let H = Int(readLine()!)!
let NQ = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = NQ[0], Q = NQ[1]
let startCards = readLine()!.split(separator: " ").compactMap { Int($0) }

var heap = Heap()
var sum = 0
var result = [Int]()
startCards.forEach {
    heap.insert($0)
    sum += $0
}

// 첫 번째 결과 (초기 카드만 사용)
while sum - heap.top >= H {
    sum -= heap.pop()
}
result.append(sum < H ? -1 : heap.size)

// 카드 추가 및 쿼리 처리
for _ in 0..<Q {
    let newValue = Int(readLine()!)!
    heap.insert(newValue)
    sum += newValue

    while sum - heap.top >= H {
        sum -= heap.pop()
    }

    result.append(sum < H ? -1 : heap.size)
}

print(result.map { String($0) }.joined(separator: "\n"))