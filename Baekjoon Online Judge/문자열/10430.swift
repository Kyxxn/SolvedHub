let input = readLine()!.split(separator: " ").map { Int($0)! }
let A = input[0], B = input[1], C = input[2]
print((A+B)%C)
print(((A%C) + (B%C))%C)
print((A*B)%C)
print(((A%C) * (B%C))%C)