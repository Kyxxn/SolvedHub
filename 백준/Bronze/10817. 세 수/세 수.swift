import Foundation


func solution(){
    var arr : [Int] = []
    arr = readLine()!.split(separator: " ").map{ Int($0)! }
    arr.sort()
    print(arr[1])
}

solution()
