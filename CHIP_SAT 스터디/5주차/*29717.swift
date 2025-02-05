let T = Int(readLine()!)!
(0..<T).forEach { _ in 
    let N = Int(readLine()!)!

    let cumulativeSlimeExp = (N * (N + 1)) / 2
    var left = 1
    var right = 1000000000
    var result = 1

    while left <= right {
        let mid = (left + right) / 2
        let needExp = (mid * (mid + 1))

        if needExp < cumulativeSlimeExp {
            left = mid + 1
            result = max(mid + 1, result)
        } else if needExp > cumulativeSlimeExp {
            right = mid - 1
        } else {
            result = mid + 1
            break
        }
    }

    print(result)
}