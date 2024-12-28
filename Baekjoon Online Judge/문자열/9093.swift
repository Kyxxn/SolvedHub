let T = Int(readLine()!)!

(0..<T).forEach { _ in 
    let input = readLine()!.split(separator: " ")
    input.forEach { str in 
        print(String(str.reversed()), terminator: " ")
    }
}