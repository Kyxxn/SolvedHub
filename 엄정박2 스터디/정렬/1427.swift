let input = readLine()!.map { (Int(String($0))!) }
print(input.sorted(by: >).map { String($0) }.joined(separator: ""))