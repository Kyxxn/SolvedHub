let _ = readLine()!
let input = readLine()!

input.forEach { char in
    char == "I"
    ? print("i", terminator: "")
    : print("L", terminator: "")
}