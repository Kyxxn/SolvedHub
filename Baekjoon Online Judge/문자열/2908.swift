let AB = readLine()!.split(separator: " ")
let A = String(AB[0].reversed())
let B = String(AB[1].reversed())

print(max(Int(A)!, Int(B)!))