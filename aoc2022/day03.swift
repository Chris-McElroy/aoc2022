//
//  day03.swift
//  aoc2022
//
//  created by chris mcelroy on 27.11.5
//

import Foundation

func d3() {
    runType = .all
    let input = inputStrings()
    var a1 = 0
    var a2 = 0

    var group: [String] = []
    
    for sack in input {
        group.append(sack)
        if group.count == 3 {
            for c in group[0] {
                if group[1].contains(c) && group[2].contains(c) {
                    a2 += c.int
                    group = []
                    break
                }
            }
        }
        
        let start = sack.first(sack.count/2)
        let end = sack.dropFirst(start.count)
        
        for c in start {
            if end.contains(c) {
                a1 += c.int
                break
            }
        }
    }
    
    printAnswer(a1, test: 157, real: 8252)
    printAnswer(a2, test: 70, real: 2828)
    copy(a1)
}
