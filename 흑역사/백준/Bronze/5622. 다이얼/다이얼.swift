// 04:09 시작
// 04:15 끝

let input = readLine()!
let map = [
    "A": 3,
    "B": 3,
    "C": 3,
    "D": 4,
    "E": 4,
    "F": 4,
    "G": 5,
    "H": 5,
    "I": 5,
    "J": 6,
    "K": 6,
    "L": 6,
    "M": 7,
    "N": 7,
    "O": 7,
    "P": 8,
    "Q": 8,
    "R": 8,
    "S": 8,
    "T": 9,
    "U": 9,
    "V": 9,
    "W": 10,
    "X": 10,
    "Y": 10,
    "Z": 10,
]

var answer = 0
for str in input {
    answer += map[String(str)]!
}
print(answer)
