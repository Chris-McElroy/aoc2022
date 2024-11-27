//
//  day08.swift
//  aoc2022
//
//  created by chris mcelroy on 27.11.5
//

import Foundation

func d8() {
    runType = .real
    let input = inputIntWords(sep: "")
    var a1 = 0
    var a2 = 0
    
    for p in input.points() {
        let h = input[p]
        var score = 1
        for dir in C2.zeroAdjacents {
            var vis = true
            var lineEnd = p
            
            for p2 in p.toOutOfBounds(of: input, by: dir) {
                lineEnd = p2
                if input[p2] >= h {
                    vis = false
                    break
                }
            }
            
            score *= lineEnd.manhattanDistance(to: p)
            if vis { store(p) }
        }
        
        a2 = max(a2, score)
    }
    
    a1 = c2Memory[0].count

    printAnswer(a1, test: 21, real: 1711)
    printAnswer(a2, test : 8, real: 301392)
    copy(a2)
}
