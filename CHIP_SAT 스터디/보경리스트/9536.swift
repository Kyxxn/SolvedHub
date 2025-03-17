let T = Int(readLine()!)!

(0..<T).forEach { _ in
    var set = Set<String>()
    let sounds = readLine()!.split(separator: " ").map { String($0) }
    sounds.forEach { set.insert($0) }

    while let input = readLine() {
        if input == "what does the fox say?" {
            break
        }
        let info = input.split(separator: " ").map { String($0) }
        let sound = info[2]
        set.remove(sound)
    }

    var result = ""
    sounds.forEach { 
        if set.contains($0) {
            result.append("\($0) ")
        }
    }
    print(result)
}