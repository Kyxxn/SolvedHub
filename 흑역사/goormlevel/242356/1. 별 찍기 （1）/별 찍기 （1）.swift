let input = Int(readLine()!)!
for i in 0..<input {
	for _ in 0...i {
		print("*", terminator: "")
	}
	print()
}