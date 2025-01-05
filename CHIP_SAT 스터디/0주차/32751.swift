let _ = readLine()!
var input = readLine()!.split(separator: " ").map { Int($0)! }
let S = readLine()!
let standard = ["a": 0, "b": 1, "c": 2, "d": 3]

var isHamburger = true
var preCharacter = ""
for char in S {
    let str = String(char)
    if preCharacter == str {
        isHamburger = false
        break
    }

    let currentMaterialIndex = standard[str]!
    input[currentMaterialIndex] -= 1
    if input[currentMaterialIndex] < 0 {
        isHamburger = false
        break
    }

    preCharacter = str
}

if isHamburger && S.first! == "a" && S.last! == "a" { 
    print("Yes")
} else {
    print("No")
}