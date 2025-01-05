let NLR = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NLR[0], L = NLR[1], R = NLR[2]
var A = readLine()!.split(separator: " ").map { Int(String($0))! }
let origin = A.sorted(by: <)
var isSequence = false

var array = [Int]()
(L...R).forEach { i in
    let index = i - 1
    array.append(A[index])
}

array.sort()
var count = 0
(L...R).forEach { i in
    let index = i - 1
    A[index] = array[count]
    count += 1
}

print(origin == A ? "1" : "0")