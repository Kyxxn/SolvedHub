import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)]
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() }
        if now == 45{ isPositive.toggle(); now = read() }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() }
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

func solution(){
    let file = FileIO()
    
    let T : Int = file.readInt()
    var result : Array<Int> = []
    
    for _ in 0..<T{
        let N : Int = file.readInt()
        var count : Int = 0 // 총 개수
        var interviewTarget : Int = 0 // 면접 성적 기준
        var ranks : Array<Array<Int>> = []
        
        for _ in 0..<N{
            let q = [file.readInt(),file.readInt()]
            ranks.append([q[0], q[1]])
        }
        
        // sort는 원본 배열을 정렬, sorted는 정렬된 배열을 리턴
        ranks.sort {
            $0[0] < $1[0]
        }
        interviewTarget = ranks[0][1] // 서류 1등의 면접 점수를 기준
        count += 1// 서류 1등은 통과
        
        for i in 1..<N{
            if (interviewTarget > ranks[i][1]){
                interviewTarget = ranks[i][1]
                count += 1
            }
        }
        result.append(count)
    }
    for i in result{
        print(i)
    }
}

solution()