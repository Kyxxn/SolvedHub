struct PriorityQueue<T> {
    private var elements: [T] = []
    private let sort: (T, T) -> Bool
    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }
    var peek: T? { elements.first }

    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }

    mutating
    func insert(_ element: T) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }

    mutating
    func remove() -> T? {
        guard !isEmpty else { return nil }
        if elements.count == 1 {
            return elements.removeLast()
        } else {
            let value = elements[0]
            elements[0] = elements.removeLast()
            siftDown(from: 0)
            return value
        }
    }
    
    mutating
    private func siftUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2

        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    mutating
    private func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = parent * 2 + 1
            let right = left + 1
            var swapIndex = parent

            if left < elements.count && sort(elements[left], elements[swapIndex]) {
                swapIndex = left
            }

            if right < elements.count && sort(elements[right], elements[swapIndex]) {
                swapIndex = right
            }

            if swapIndex == parent {
                return
            }

            elements.swapAt(parent, swapIndex)
            parent = swapIndex
        }
    }
}

let T = Int(readLine()!)!
(0..<T).forEach { _ in
    let k = Int(readLine()!)!
    var maxHeap = PriorityQueue<(Int, Int)>(sort: >)
    var minHeap = PriorityQueue<(Int, Int)>(sort: <)
    var isDeleted = [Bool](repeating: false, count: k)
    var currentIndex = 0

    for _ in 0..<k {
        let command = readLine()!.split(separator: " ")
        let op = command[0]
        let num = Int(command[1])!

        if op == "I" {
            maxHeap.insert((num, currentIndex))
            minHeap.insert((num, currentIndex))
            isDeleted[currentIndex] = false
            currentIndex += 1
        } else if op == "D" {
            if num == 1 {
                while !maxHeap.isEmpty, let (_, index) = maxHeap.peek, isDeleted[index] {
                    maxHeap.remove()
                }
                if !maxHeap.isEmpty {
                    let (_, index) = maxHeap.remove()!
                    isDeleted[index] = true
                }
            } else if num == -1 {
                while !minHeap.isEmpty, let (_, index) = minHeap.peek, isDeleted[index] {
                    minHeap.remove()
                }
                if !minHeap.isEmpty {
                    let (_, index) = minHeap.remove()!
                    isDeleted[index] = true
                }
            }
        }
    }

    while !maxHeap.isEmpty, let (_, index) = maxHeap.peek, isDeleted[index] {
        maxHeap.remove()
    }

    while !minHeap.isEmpty, let (_, index) = minHeap.peek, isDeleted[index] {
        minHeap.remove()
    }

    if maxHeap.isEmpty || minHeap.isEmpty {
        print("EMPTY")
    } else {
        let maxVal = maxHeap.peek!.0
        let minVal = minHeap.peek!.0
        print("\(maxVal) \(minVal)")
    }
}