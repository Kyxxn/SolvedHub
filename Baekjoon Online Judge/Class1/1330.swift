let input = readLine()!.split(separator: " ").map { Int($0)! }
let A = input[0]
let B = input[1]

if A == B {
    print("==")
} else if A < B {
    print("<")
} else { 
    print(">")
}