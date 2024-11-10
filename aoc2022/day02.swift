//
//  day02.swift
//  aoc2022
//
//  created by chris mcelroy on 27.11.5
//

import Foundation

func d2() {
    runType = .all
    let input = inputWords()
    var a1 = 0
    var a2 = 0
    
    a1 += input.count(where: { $0.contains("X")})
    a1 += input.count(where: { $0.contains("Y")})*2
    a1 += input.count(where: { $0.contains("Z")})*3
    
    a2 += input.count(where: { $0.contains("X")})*0
    a2 += input.count(where: { $0.contains("Y")})*3
    a2 += input.count(where: { $0.contains("Z")})*6
    
    for line in input {
        let diff = line.last!.first! - line.first!.first!
        switch diff {
        case 21: a1 += 6
        case 22: a1 += 0
        case 23: a1 += 3
        case 24: a1 += 6
        case 25: a1 += 0
        default: break
        }
        
        if line.first == "A" {
            if line.last == "X" {
                a2 += 3
            } else if line.last == "Y" {
                a2 += 1
            } else {
                a2 += 2
            }
        } else if line.first == "B" {
            if line.last == "X" {
                a2 += 1
            } else if line.last == "Y" {
                a2 += 2
            } else {
                a2 += 3
            }
        } else if line.first == "C" {
            if line.last == "X" {
                a2 += 2
            } else if line.last == "Y" {
                a2 += 3
            } else {
                a2 += 1
            }
        }
    }

    printAnswer(a1, test: 15, real: 11603)
    printAnswer(a2, test: 12, real: 12725)
    copy(a2)
}
