//
//  day04.swift
//  aoc2022
//
//  created by chris mcelroy on 27.11.5
//

import Foundation

func d4() {
    runType = .all
    let input = inputIntSubWords(sep1: ",", sep2: "-")
    
    var a1 = 0
    var a2 = 0

    for line in input {
        let r1 = line[0].makeClosedRange()!
        let r2 = line[1].makeClosedRange()!
        
        a1 += (r1.contains(r2) || r2.contains(r1)).int
        
        a2 += r1.overlaps(r2).int
    }

    printAnswer(a1, test: 2, real: 448)
    printAnswer(a2, test: 4, real: 794)
//    copy(a1)
}
