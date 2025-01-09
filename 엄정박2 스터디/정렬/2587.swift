var array = [Int]()
var average = 0
(0..<5).forEach { _ in 
    let input = Int(readLine()!)!
    average += input
    array.append(input)
}

print(average / 5)
array.sort()
print(array[2])