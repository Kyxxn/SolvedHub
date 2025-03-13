let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let N = firstLine[0], M = firstLine[1]
var friends = Array(repeating: Set<Int>(), count: N + 1)

for _ in 0..<M {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let A = line[0], B = line[1]
    friends[A].insert(B)
    friends[B].insert(A)
}

var days = 0
var dailyNewFriendships: [Int] = []

while true {
    var newFriendships = Set<[Int]>()

    for person in 1...N {
        for friend in friends[person] {
            for friendOfFriend in friends[friend] {
                if friendOfFriend != person && !friends[person].contains(friendOfFriend) {
                    newFriendships.insert([min(person, friendOfFriend), max(person, friendOfFriend)])
                }
            }
        }
    }
    
    if newFriendships.isEmpty {
        break
    }
    
    days += 1
    dailyNewFriendships.append(newFriendships.count)

    for pair in newFriendships {
        let a = pair[0], b = pair[1]
        friends[a].insert(b)
        friends[b].insert(a)
    }
}

print(days)
for count in dailyNewFriendships {
    print(count)
}