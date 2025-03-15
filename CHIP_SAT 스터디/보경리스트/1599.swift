var minsikMapping: [String: String] = [
    "a": "a", "b": "b", "k": "c", "d": "d", "e": "e", "g": "f",
    "h": "g", "i": "h", "l": "i", "m": "j", "n": "k", "ng": "l",
    "o": "m", "p": "n", "r": "o", "s": "p", "t": "q", "u": "r",
    "w": "s", "y": "t"
]

let N = Int(readLine()!)!
var originWords = [Int: String]()
var words = [(String, Int)]()
(0..<N).forEach { count in
    let input = readLine()!
    let inputArray = Array(input)
    originWords[count, default: ""] = input
    var currentString = ""
    var preNG = false

    for (idx, char) in inputArray.enumerated() {
        if preNG {
            preNG = false
            continue
        }

        if char != "n" {
            currentString += minsikMapping[String(char), default: ""]
        } else {
            if idx + 1 < inputArray.count {
                if inputArray[idx+1] == "g" {
                    preNG = true
                    currentString += "l"
                } else {
                    currentString += minsikMapping[String(char), default: ""]
                }
            } else {
                currentString += minsikMapping[String(char), default: ""]
            }
        }
    }
    words.append((currentString, count))
}

words.sort {
    $0.0 < $1.0
}

for word in words {
    print(originWords[word.1]!)
}