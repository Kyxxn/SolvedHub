let input = Int(readLine()!)!

for i in 1...input {
    for _ in i..<input {
        print(" ", terminator: "")
    }

    for _ in 1...i {
        print("*", terminator: "")
    }
    print()
}