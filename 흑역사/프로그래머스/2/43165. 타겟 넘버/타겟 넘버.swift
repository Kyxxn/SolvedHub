// 1809 시작
// 1823 트리 만들고 DFS 생각 떠올림 (13분)
// 1829 트리 어케 만드노?
// 1848 트리를 구현하는 내가 잘못됨을 깨달음


import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var answer: Int = 0
    func dfs(idx: Int, sum: Int) {
        if idx == numbers.count {
            if (sum == target) {
                answer += 1
            }
            return
        }
        
        dfs(idx: idx + 1, sum: sum + numbers[idx])
        dfs(idx: idx + 1, sum: sum - numbers[idx])
    }
    
    dfs(idx: 0, sum: 0)
    
    return answer
}



// class TreeNode{
//     var data: Int
//     var leftChild: Node?
//     var rightChild: Node?
    
//     init(data: Int, leftChild: Node?, rightChild: Node?){
//         self.data = data
//         self.leftChild = leftChild
//         self.rightChild = rightChild
//     }
    
//     func append(data: Int, )
// }
