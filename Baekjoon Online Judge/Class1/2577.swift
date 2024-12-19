let A = Int(readLine()!)!
let B = Int(readLine()!)!
let C = Int(readLine()!)!
let mul = A * B * C

var countArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
String(mul).forEach { i in
    if let intValue = i.wholeNumberValue {
        countArray[intValue] += 1
    }
}

countArray.forEach { i in
    print(i)
}