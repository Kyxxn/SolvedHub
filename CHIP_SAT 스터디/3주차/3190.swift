// 시작 1443
// 1차 답안 1657 -> 19%틀림

struct Deque {
    var front = [XY]()
    var back = [XY]()

    mutating
    func pushFront(_ value: XY) {
        front.append(value)
    }

    mutating
    func pushBack(_ value: XY) {
        back.append(value)
    }

    mutating
    func popFront() -> XY {
        if front.isEmpty {
            front = back.reversed()
            back.removeAll()
        }
        return front.removeLast()
    }

    mutating
    func popBack() -> XY {
        if back.isEmpty {
            back = front.reversed()
            front.removeAll()
        }
        return back.removeLast()
    }
}

struct XY: Hashable {
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

struct Snake {
    let wall: Int
    var head = XY(1, 1)
    var tail = XY(1, 1)
    var body = Deque()
    var set = Set<XY>() // 몸통이 담겨있음 머리랑 꼬리도 포함
    // 머리가 이동한 좌표를 pushFront 넣고
    // 사과가 없으면 popBack으로 꼬리를 제외함

    init(wall: Int) {
        self.wall = wall
    }

    // 1. head를 옮김
    // 2. 벽이나 자기자신 몸과 부딪혔는지 확인
    func isFinish(head: XY) -> Bool {
        // 벽에 부딪혀 죽음
        guard 1...wall ~= head.x, 1...wall ~= head.y else { return false }

        // 자신의 몸과 부딪힘
        guard !set.contains(head) else { return false }

        return true
    }
}

let N = Int(readLine()!)!
var board = Array(repeating: Array(repeating: false, count: N + 1), count: N + 1)
let K = Int(readLine()!)!
// 사과 처리
(0..<K).forEach { _ in 
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    board[xy[0]][xy[1]] = true
}

// 방향 처리
let L = Int(readLine()!)!
var command = [Int: String]()
(0..<L).forEach { _ in 
    let input = readLine()!.split(separator: " ").map { String($0) }
    let X = Int(input[0])!, C = input[1]
    // 시작 시점으로부터 X초 뒤에 C로 방향 전환
    // C가 L이면 왼쪽 90도, D이면 오른쪽 90도
    command[X, default: ""] = C
}

// 0 -> 오른
// 1 -> 아래
// 2 -> 왼쪽
// 3 -> 위
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]
var state = 0
// D이면 state += 1 해서 1 아래를 가리킴
// L이면 state -= 1 해서 3 위를 가리킴 (원형)

var snake = Snake(wall: N)
snake.set.insert(XY(1, 1))
var count = 0
while true {
    // print("뱀정보")
    // print(snake.head)
    // print(snake.body)
    // print(snake.tail)
    // print("---")

    // 방향 바꿀지 검사
    if let cmd = command[count] {
        // print("현재 초: \(count) 현재경로: \(dx[state]) \(dy[state]) 딕셔너리: \(cmd)")
        if cmd == "D" {
            state += 1
            if state > 3 {
                state = 0
            }
        } else {
            state -= 1
            if state < 0 {
                state = 3
            }
        }
    }

    // 새 헤드 위치 만들고
    let currentHead = snake.head
    let newHead = XY(currentHead.x + dx[state], currentHead.y + dy[state])
    snake.head = newHead
    snake.body.pushBack(newHead)

    // 헤드 위치가 정상인지 검사하고
    guard snake.isFinish(head: newHead) else { break }

    // 사과가 없으면 꼬리를 뗌
    if !board[newHead.x][newHead.y] {
        let newTail = snake.body.popFront()
        snake.set.remove(snake.tail)
        snake.tail = newTail
    } else { // 사과 먹으면 처리
        board[newHead.x][newHead.y] = false
    }
    snake.set.insert(newHead)
    count += 1
}

print(count + 1)