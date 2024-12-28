while let input = readLine() {
    var xyz = input.split(separator: " ").map { Int($0)! }
    xyz.sort()
    let x = xyz[0], y = xyz[1], z = xyz[2]
    if x == 0, y == 0, z == 0 { break }

    print(x * x + y * y == z * z ? "right" : "wrong")
}