//
//  main.swift
//  Algorithm
//
//  Created by 박효준 on 3/13/24.
//  16:24 시작
//  16:44 끝

import Foundation

let T = Int(readLine()!)!
for _ in 0..<T {
    let p = readLine()!
    let n = Int(readLine()!)!
    let inputArr: [Int] = readLine()!.dropFirst().dropLast().split(separator: ",").map{Int($0)!}
    
    var header = 0, tail = n - 1
    var reservedCheck = false
    var errorCheck = false
    
    for cmd in p {
        if cmd == "R" { reservedCheck.toggle() }
        else if cmd == "D" {
            if header > tail {
                errorCheck = true
                break
            }
            
            if reservedCheck {
                // tail을 줄이기
                tail -= 1
            }else {
                header += 1
            }
        }
        
    }
    
    if errorCheck {
        print("error")
    }else if header > tail {
        print("[]")
    }else{
        let answer: String
        if reservedCheck {
            answer = inputArr[header...tail].reversed().map{String($0)}.joined(separator: ",")
            print("[" + answer + "]")
        }else {
            answer = inputArr[header...tail].map{String($0)}.joined(separator: ",")
            print("[" + answer + "]")
        }
    }
}
