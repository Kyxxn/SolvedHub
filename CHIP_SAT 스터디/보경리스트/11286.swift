import Foundation

struct ABSHeap {
    var array = [(0, 0)]

    mutating
    func insert(_ value: (Int, Int)) {
        array.append(value)
        var currentIndex = array.count - 1
        var parentIndex = currentIndex / 2
        while currentIndex > 1 && array[currentIndex].0 <= array[parentIndex].0 {
            if array[currentIndex].0 == array[parentIndex].0 {
                if array[currentIndex].1 < array[parentIndex].1 {
                    array.swapAt(currentIndex, parentIndex)
                    currentIndex = parentIndex
                    parentIndex = currentIndex / 2
                } else {
                    break
                }
            } else { // <
                array.swapAt(currentIndex, parentIndex)
                currentIndex = parentIndex
                parentIndex = currentIndex / 2
            }
        }
    }

    mutating
    func pop() -> Int {
        guard array.count > 1 else { return 0 }
        array.swapAt(1, array.count - 1)
        let returnValue = array.removeLast()
        moveDown(1)

        return returnValue.1
    }

    mutating
    func moveDown(_ index: Int) {
        let left = index * 2
        let right = index * 2 + 1
        var swapIndex = index

        if left < array.endIndex && array[swapIndex].0 >= array[left].0 {
            if array[swapIndex].0 == array[left].0 {
                if array[swapIndex].1 > array[left].1 {
                    swapIndex = left
                }
            } else {
                swapIndex = left
            }
        }
        
        if right < array.endIndex && array[swapIndex].0 >= array[right].0 {
            if array[swapIndex].0 == array[right].0 {
                if array[swapIndex].1 > array[right].1 {
                    swapIndex = right
                }
            } else {
                swapIndex = right
            }
        }

        if swapIndex != index {
            array.swapAt(index, swapIndex)
            moveDown(swapIndex)
        }
    }
}

var heap = ABSHeap()
let N = Int(readLine()!)!
for _ in 0..<N {
    let input = Int(readLine()!)!
    if input == 0 {
        if heap.array.count == 1 {
            print(0)
            continue
        }
        print(heap.pop())
    } else {
        heap.insert((abs(input), input))
    }
}