while let input = readLine() {
    let AB = input.split(separator: " ").map { Int($0)! }
    if AB[0] == 0 && AB[1] == 0 { break }
    print(AB[0] + AB[1])
}