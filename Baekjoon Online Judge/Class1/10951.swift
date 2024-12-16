while let input = readLine() {
    let AB = input.split(separator: " ").map { Int($0)! }
    print(AB[0] + AB[1])
}