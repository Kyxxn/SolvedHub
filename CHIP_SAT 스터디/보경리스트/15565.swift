let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0], K = NK[1]
let input = readLine()!.split(separator: " ").map { Int($0)! }

var left = 0, right = 0
var ryans = 0
var minLength = Int.max

while right < N {
    if input[right] == 1 {
        ryans += 1
    }

    while ryans >= K {
        minLength = min(minLength, right - left + 1)
        if input[left] == 1 {
            ryans -= 1
        }
        left += 1
    }

    right += 1
}
print(minLength == Int.max ? -1 : minLength)