let input = readLine()!
var operatorStack = [Character]()
var result = ""
let operatorPriorityDict: [Character: Int] = ["+": 1, "-": 1, "*": 2, "/": 2]

input.forEach {
    if !operatorPriorityDict.keys.contains($0) && $0 != "(" && $0 != ")" {
        result += String($0)
    } else if $0 == "(" {
        operatorStack.append($0)
    } else if $0 == ")" {
        while !operatorStack.isEmpty,
        let popOperator = operatorStack.last,
        popOperator != "(" {
            result += String(operatorStack.removeLast())
        }
        operatorStack.removeLast()
    } else { // + - * /
        // + -가 나오면 stack에 ( 전까지 * /를 result에 옮김
        let priority = operatorPriorityDict[$0]!
        while !operatorStack.isEmpty,
        let popOperator = operatorStack.last,
        popOperator != "(",
        operatorPriorityDict[popOperator]! >= priority {
            result += String(popOperator)
            operatorStack.removeLast()
        }
        operatorStack.append($0)
    }
}

while !operatorStack.isEmpty {
    result += String(operatorStack.removeLast())
}

print(result)

// A * ( B + C )
// A: 피연산자는 바로 result
// +, -: pop해서 같은 우선순위 애들 다 비움
// *, /: ) 전까지 operatorStack 비움
// ): (까지 pop함