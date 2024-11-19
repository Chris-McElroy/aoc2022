//
//  day06.swift
//  aoc2022
//
//  created by chris mcelroy on 27.11.5
//

import Foundation

func d6() {
    runType = .all
    let input = inputCharacters()
    let a1 = input.indices.first { i in input[i..<i+4].allUnique() }! + 4
    let a2 = input.indices.first { i in input[i..<i+14].allUnique() }! + 14
    
    printAnswer(a1, test: 7, real: 1896)
    printAnswer(a2, test: 19, real: 3452)
    copy(a1)
}
