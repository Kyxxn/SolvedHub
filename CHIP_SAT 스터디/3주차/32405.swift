let N = Int(readLine()!)!
let ads = [0] + readLine()!.split(separator: " ").map { Int($0)! }
var hps = [0] + readLine()!.split(separator: " ").map { Int($0)! }

var players = (1...N).map { $0 }
var damage = 0, round = 0

while players.count > 1 {
    var alive = [Int]() // 한 라운드에 생존한 플레이어
    for player in players {
        let currentPlayerHP = hps[player]
        if players.count < 2 { break }
        if currentPlayerHP <= 0 { continue }
        if currentPlayerHP < damage - (round * ads[player]) {
            hps[player] = 0
            continue
        }

        alive.append(player)
        damage += ads[player]
    }
    players = alive
    round += 1
}

print(players.first!)