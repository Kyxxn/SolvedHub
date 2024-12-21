let T = Int(readLine()!)!

for _ in 0..<T {
    let input = readLine()!.split(separator: " ")
    let R = Int(input[0])!
    let S = String(input[1])

    for i in S {
        for _ in 0..<R {
            print(i, terminator: "")
        }
    }
    print()
}