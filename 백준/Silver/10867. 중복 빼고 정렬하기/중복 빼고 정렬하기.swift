let N : Int = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map( { Int(String($0))! })
var arr : [Int] = []
input.forEach { data in
    if (!arr.contains(data)){
        arr.append(data)
    }
}
arr.sort()
arr.forEach { data in
    print(data, terminator: " ")
}