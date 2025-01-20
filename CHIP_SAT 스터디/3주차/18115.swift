struct Deque {
    private var front = [Int]()
    private var back = [Int]()

    var isEmpty: Bool { front.isEmpty && back.isEmpty }
    var size: Int { front.count + back.count }

    mutating
    func pushFront(_ value: Int) {
        front.append(value)
    }

    mutating
    func pushBack(_ value: Int) {
        back.append(value)
    }

    mutating
    func popFront() -> Int {
        if front.isEmpty {
            front = back.reversed()
            back.removeAll()
        }
        return front.removeLast()
    }

    mutating
    func popBack() -> Int {
        if back.isEmpty {
            back = back.reversed()
            front.removeAll()
        }
        return back.removeLast()
    }
}

let N = Int(readLine()!)!
let skills = readLine()!.split(separator: " ").reversed().map { Int($0)! }
var deque = Deque()
var count = 1

for skill in skills {
    switch skill {
    case 1:
        deque.pushFront(count)
    case 2:
        let first = deque.popFront()
        deque.pushFront(count)
        deque.pushFront(first)
    case 3:
        deque.pushBack(count)
    default: break
    }
    count += 1
}

while !deque.isEmpty {
    print(deque.popFront(), terminator: " ")
}