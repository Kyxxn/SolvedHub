import Foundation


func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var dic : [Int : Int] = [:]
    var count : Int = 0
    var tmp = k
    for data in tangerine{
        if dic[data] != nil {
            if let value = dic[data]{
                dic[data] = value + 1
            }
        }else{
            dic[data] = 1
        }
    }
    // 딕셔너리 완성
    
    var sortedDict : Array<(Int, Int)> = dic.sorted{ $0.value > $1.value }
    for data in sortedDict{
        tmp -= data.1
        count += 1
        if(tmp <= 0) {
            break
        }
    }
    
    
    return count
}