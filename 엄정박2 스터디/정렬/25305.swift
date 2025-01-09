let Nk = readLine()!.split(separator: " ").map { Int($0)! }
let N = Nk[0], k = Nk[1]
var input = readLine()!.split(separator: " ").map { Int($0)! }
input.sort()
print(input[N - k])