let arr = readLine()!.split(separator: " ").map{Int($0)!}
let n = arr[0]
let m = arr[1]
var v = arr[2]

var graph: [[Int]] = Array(repeating: [], count: n + 1) //이차원 배열을 [i][j]라고 한다면 [i]는 시작노드, [j]는 도착노드
var visited = Array(repeating: false, count: n + 1) //방문여부 저장
var queue = Queue<Int>() //아래 선언한 Queue구조체를 가져왔다.

for _ in 1...m{ //1번
    let a: [Int] = readLine()!.split(separator: " ").map{Int($0)!}
    graph[a[0]].append(a[1])
    graph[a[1]].append(a[0])
    graph[a[0]].sort()
    graph[a[1]].sort()
}
DFS(graph, v, &visited)
visited = Array(repeating: false, count: n + 1) //초기화 해줘야 BFS에서 써먹는다.
print("")
BFS(graph, &v, &visited)

func DFS(_ graph: [[Int]], _ v: Int, _ visited: inout [Bool]){//2번
    visited[v] = true
    print(v,terminator: " ")
    
    for i in graph[v]{
        if !visited[i] {
            DFS(graph, i, &visited)
        }
    }
}


func BFS(_ graph: [[Int]], _ v: inout Int, _ visited: inout [Bool]){//3번
    visited[v] = true
    queue.enque(v)
    
    while !queue.isEmpty(){
        v = queue.deque()
        print(v, terminator: " ")
        
        for i in graph[v]{
            if !visited[i] {
                queue.enque(i)
                visited[i] = true
            }
        }
    }
}

struct Queue<T>{
    var queue :[Int] = []
    mutating func enque(_ x: Int){
        queue.append(x)
    }
    mutating func deque() -> Int{
        if !queue.isEmpty{
            queue.reverse()
            let a = queue.removeLast()
            queue.reverse()
            return a
        }else {
            return 0
        }
    }
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
}