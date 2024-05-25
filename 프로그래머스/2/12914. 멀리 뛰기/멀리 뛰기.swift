// 23:49 시작
// 23:54 contain 안 쓰려고 Set 시도
// 12:01 규칙을 찾음

func solution(_ n:Int) -> Int {
    if n == 1 {
        return 1
    }
    
    var arr: [Int] = [1, 1]
    for i in 2...n {
        var sum = arr[i - 1] + arr[i - 2]
        arr.append(sum % 1234567)
    }
    
    return arr[n] 
}