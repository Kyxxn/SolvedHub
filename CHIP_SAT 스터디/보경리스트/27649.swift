// 1232 시작

let separators: Set<String> = ["<", ">", "&", "|", "(", ")"]
let input = readLine()!
var isTwoSeparator = false
var answer = ""
for char in input {
    if !separators.contains(String(char)) { 
        answer += String(char)
        continue 
    }
    if isTwoSeparator {
        isTwoSeparator = false
        continue
    }

    if char == "|" {
        answer += " || "
        isTwoSeparator = true
        continue
    }
    if char == "&" {
        answer += " && "
        isTwoSeparator = true
        continue
    }

    answer += " \(String(char)) "
}

print(answer.split(separator: " ").joined(separator: " "))