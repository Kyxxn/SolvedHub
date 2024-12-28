func isPalindrome(_ str: [Character], _ front: Int, _ back: Int) -> Bool {
    var frontIndex = front
    var backIndex = back
    
    while frontIndex < backIndex {
        if str[frontIndex] != str[backIndex] {
            return false
        }
        frontIndex += 1
        backIndex -= 1
    }
    return true
}

func validPalindrome(string: String) -> Int {
    let str = Array(string)
    var frontIndex = 0
    var backIndex = str.count - 1
    
    while frontIndex < backIndex {
        if str[frontIndex] != str[backIndex] {
            // 유사회문 검증
            let skipFront = isPalindrome(str, frontIndex + 1, backIndex)
            let skipBack = isPalindrome(str, frontIndex, backIndex - 1)
            
            if skipFront || skipBack {
                return 1
            } else {
                return 2
            }
        }
        frontIndex += 1
        backIndex -= 1
    }
    return 0
}

let T = Int(readLine()!)!

(0..<T).forEach { _ in 
    let input = readLine()!
    print(validPalindrome(string: input))
}