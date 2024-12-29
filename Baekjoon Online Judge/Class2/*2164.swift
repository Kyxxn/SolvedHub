let N = Int(readLine()!)!
var array = Array(1...N)
var pointer = 0
while array.count - pointer > 1 {
    pointer += 1
    array.append(array[pointer])
    pointer += 1
}

print(array[pointer])