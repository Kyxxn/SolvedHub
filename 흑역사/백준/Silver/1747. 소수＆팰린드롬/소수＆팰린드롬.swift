
import Foundation

func isPrime(_ N : Int) -> Bool{
    // 소수는 1과 자기 자신만 약수인 경우
    if N <= 1 { return false }
    if N <= 3 { return true }
    
    for i in 2...Int(sqrt(Double(N))){
        if N % i == 0{
            return false
        }
    }
    
    return true
}

func isPalindrome(_ N : Int) -> Bool{
    let s = String(N)
    return s == String(s.reversed())
}

if var N = Int(readLine()!) {
    while (true){
        if (isPrime(N) && isPalindrome(N)) {
            print(N)
            break
        }
        N += 1
    }
}
