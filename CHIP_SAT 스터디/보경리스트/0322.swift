struct User {
    var id: Int
    var startTime: Int
    var 자리비움Time: Int
    var 종료Time: Int

    init(_ id: Int, _ startTime: Int, _ 자리비움Time: Int, _ 종료Time: Int) {
        self.id = id
        self.startTime = startTime
        self.자리비움Time = 자리비움Time
        self.종료Time = 종료Time
    }
}

func solution(n: Int, a: Int, b: Int, requests: [[Int]]) -> [Int] {
    var answer = [Int]()
    var queue = [User]()

    for request in requests {
        let (time, id) = (request[0], request[1])
        let currentUser = User(id, time, time + a, time + b)

        // 1. 종료된 유저 제거
        queue = queue.filter { $0.종료Time > time }

        // 2. 유저가 이미 있으면 업데이트
        if let index = queue.firstIndex(where: { $0.id == id }) {
            queue[index] = currentUser
            answer.append(queue.count)
            continue
        }

        // 3. 빈자리가 있으면 추가
        if queue.count < n {
            queue.append(currentUser)
            answer.append(queue.count)
            continue
        }

        // 4. 자리비움 중인 유저 찾아서 제거하고 추가
        if let idleIndex = queue.firstIndex(where: { $0.자리비움Time <= time }) {
            queue.remove(at: idleIndex)
            queue.append(currentUser)
            answer.append(queue.count)
            continue
        }

        // 5. 아무것도 못했으면 거절
        answer.append(-1)
    }

    return answer
}