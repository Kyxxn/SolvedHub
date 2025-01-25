let AB = readLine()!.split(separator: " ").map { Int($0)! }
let A = Set(readLine()!.split(separator: " ").map { Int($0)! })
let B = Set(readLine()!.split(separator: " ").map { Int($0)! })

print(A.symmetricDifference(B).count)