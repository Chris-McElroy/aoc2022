//
//  day05.swift
//  aoc2022
//
//  created by chris mcelroy on 27.11.5
//

import Foundation

func d5() {
    runType = .all
    
    let blankline = inputStrings().firstIndex(of: "")!
    let setup = inputStrings(lineRange: 1...blankline)
    
    var stacks1 = setup.transpose().filter({ $0.contains { $0.isNumber }}).map { Array($0.drop(while: { $0 == " " } ).dropLast().reversed()) }
    stacks1.insert([], at: 0)
    
    let instructions = inputIntWords(lineRange: (blankline + 2)...Int.max)

    var stacks2 = stacks1
    
    for ins in instructions {
        // moving apart
        let moving1 = stacks1[ins[1]].last(ins[0]).reversed()
        stacks1[ins[1]] = stacks1[ins[1]].dropLast(ins[0])
        stacks1[ins[2]] += moving1
        
        // moving together
        let moving2 = stacks2[ins[1]].last(ins[0])
        stacks2[ins[1]] = stacks2[ins[1]].dropLast(ins[0])
        stacks2[ins[2]] += moving2
    }
    
    let a1 = String(stacks1.compactMap { $0.last })
    let a2 = String(stacks2.compactMap { $0.last })

    printAnswer(a1, test: "CMZ", real: "TGWSMRBPN")
    printAnswer(a2, test: "MCD", real: "TZLTLWRNF")
//    copy(a1)
}
