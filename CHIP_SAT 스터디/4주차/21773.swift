struct Process {
    let id: Int
    var taskTime: Int
    var priority: Int

    init(_ id: Int, _ taskTime: Int, _ priority: Int) {
        self.id = id
        self.taskTime = taskTime
        self.priority = priority
    }
}
struct PriorityQueue {
    var heap = [Process(0, 0, 0)]
    
    mutating
    func insert(_ process: Process) {
        heap.append(process)
        var currentIndex = heap.count - 1
        var parentIndex = currentIndex / 2
        while currentIndex > 1 && heap[currentIndex].priority >= heap[parentIndex].priority {
            if heap[currentIndex].priority == heap[parentIndex].priority {
                if heap[currentIndex].id < heap[parentIndex].id {
                    // 우선순위 같고, 자식이 pid가 더 낮은 경우
                    heap.swapAt(currentIndex, parentIndex)
                }
            } else { // 우선순위가 다를 때
                heap.swapAt(currentIndex, parentIndex)
            }
            currentIndex = parentIndex
            parentIndex = currentIndex / 2
        }
    }

    mutating
    func pop() -> Process {
        heap.swapAt(1, heap.count - 1)
        let returnProcess = heap.removeLast()
        moveDown(1)
        heap = heap.map { Process($0.id, $0.taskTime, $0.priority + 1) }

        return returnProcess
    }

    mutating
    func moveDown(_ index: Int) {
        let leftChildIndex = 2 * index
        let rightChildIndex = 2 * index + 1
        var swapIndex = index 

        if leftChildIndex < heap.endIndex && heap[leftChildIndex].priority >= heap[swapIndex].priority {
            if heap[leftChildIndex].priority == heap[swapIndex].priority {
                if heap[leftChildIndex].id < heap[swapIndex].id {
                    // 우선순위 같고, 자식이 pid가 더 낮은 경우
                    swapIndex = leftChildIndex
                }
            } else {
                swapIndex = leftChildIndex
            }
        }

        if rightChildIndex < heap.endIndex && heap[rightChildIndex].priority >= heap[swapIndex].priority {
            if heap[rightChildIndex].priority == heap[swapIndex].priority {
                if heap[rightChildIndex].id < heap[swapIndex].id {
                    // 우선순위 같고, 자식이 pid가 더 낮은 경우
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

let Tn = readLine()!.split(separator: " ").compactMap { Int($0) }
var T = Tn[0], n = Tn[1]
var heap = PriorityQueue()
(0..<n).forEach { _ in 
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let pid = input[0], taskTime = input[1], priority = input[2]
    heap.insert(Process(pid, taskTime, priority))
}

var result = [Int]()
while T > 0 {
    T -= 1

    let popProcess = heap.pop() // 우선순위 제일 높음
    let popPid = popProcess.id
    let popTaskTime = popProcess.taskTime
    let popPriority = popProcess.priority
    result.append(popPid)

    heap.insert(Process(popPid, popTaskTime - 1, popPriority))
}
print(result.map { String($0) }.joined(separator: "\n"))