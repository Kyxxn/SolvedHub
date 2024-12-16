(0..<input).forEach { _ in
    let AB = readLine()!.split(separator: " ").map { Int($0)! }
    print(AB[0] + AB[1])
}