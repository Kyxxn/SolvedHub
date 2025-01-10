let N = Int(readLine()!)!
var positives = [Int]()
var negatives = [Int]()
var result = 0
(0..<N).forEach { _ in 
    let input = Int(readLine()!)!
    if input > 1 {
        positives.append(input)
    } else if input <= 0 {
        negatives.append(input)
    } else {
        // 1은 걍 더함
        result += input
    }
}

positives.sort()
negatives.sort()

// 양수처리
while positives.count > 1 {
    let first = positives.removeLast()
    let second = positives.removeLast()

    result += (first * second)
}
if !positives.isEmpty { result += positives[0] }

// 음수처리
if let last = negatives.last, last == 0 {
    if negatives.count % 2 != 0 {
        // 음수의 개수가 홀수일 때 0을 제거하여 한 쌍으로 만듦
        negatives.removeLast()
    }
}

while negatives.count > 1 {
    let first = negatives.removeFirst()
    let second = negatives.removeFirst()
    result += (first * second)
}
if !negatives.isEmpty { result += negatives[0] }

print(result)