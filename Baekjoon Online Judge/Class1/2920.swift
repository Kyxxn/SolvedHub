let input = readLine()!.split(separator: " ").map { Int($0)! }

if input == input.sorted(by: <) {
    print("ascending")
} else if input == input.sorted(by: >) {
    print("descending")
} else {
    print("mixed")
}