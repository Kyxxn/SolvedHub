// 시작 2027
// 문제이해 2038
func 쿠키먹방(_ x: Int, _ y: Int, _ size: Int) {
    if size == 1 { return }

    var sum = 0
    for i in x..<x+size {
        for j in y..<y+size {
            sum += cookies[i][j]
        }
    }

    var targetIndex = sum % 4
    var tempArray = [[x, y], [x, y + size/2], [x + size/2, y], [x + size/2, y + size/2]]

    for i in 0..<4 {
        var dx = tempArray[i][0]
        var dy = tempArray[i][1]
        if targetIndex == i {
            for k in dx..<dx+size/2 {
                for l in dy..<dy+size/2 {
                    빼야할누적합 += cookies[k][l]
                }
            }
        } else {
            쿠키먹방(dx, dy, size/2)
        }
        
    }
}

var 빼야할누적합 = 0
var cookies = [[Int]]()
let T = Int(readLine()!)!
(0..<T).forEach { _ in 
    let N = Int(readLine()!)!
    cookies = Array(repeating: [Int](), count: N)

    (0..<N).forEach { i in
        let input = readLine()!
        for value in input {
            cookies[i].append(Int(String(value))!)
        }
    }

    var sum = 0
    for row in cookies {
        sum += row.reduce(0, +)
    }

    쿠키먹방(0, 0, N)

    print(sum - 빼야할누적합)
    빼야할누적합 = 0
}