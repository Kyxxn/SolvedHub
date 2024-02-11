import Foundation

func solution(_ places:[[String]]) -> [Int] {
    let dx = [1, -1, 0, 0, 1, 1, -1, -1, 2, -2, 0, 0] // 상하좌우 + 대각선 + 2칸 상하좌우
    let dy = [0, 0, 1, -1, 1, -1, 1, -1, 0, 0, 2, -2]
    var answer: [Int] = []

    for place in places {
        var room = place.map { Array($0) }
        var isSafe = 1

        outerLoop: for i in 0..<5 {
            for j in 0..<5 where room[i][j] == "P" {
                for k in 0..<12 {
                    let nx = i + dx[k]
                    let ny = j + dy[k]

                    if nx >= 0 && nx < 5 && ny >= 0 && ny < 5 {
                        if k < 8 { // 대각선 포함 1칸 이동
                            if room[nx][ny] == "P" {
                                if !(k >= 4 && room[i][ny] == "X" && room[nx][j] == "X") {
                                    isSafe = 0
                                    break outerLoop
                                }
                            }
                        } else if room[nx][ny] == "P" { // 2칸 이동
                            if (k == 8 || k == 9) && room[(i + nx) / 2][j] != "X" || // 상하
                                (k == 10 || k == 11) && room[i][(j + ny) / 2] != "X" { // 좌우
                                isSafe = 0
                                break outerLoop
                            }
                        }
                    }
                }
            }
        }
        answer.append(isSafe)
    }

    return answer
}
