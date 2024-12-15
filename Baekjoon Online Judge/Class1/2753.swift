let input = Int(readLine()!)!

input % 4 == 0 && (input % 100 != 0 || input % 400 == 0)
? print(1)
: print(0)