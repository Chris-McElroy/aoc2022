//
//  day01.swift
//  aoc2022
//
//  created by chris mcelroy on 27.11.5
//

import Foundation


func d1() {
    runType = .all
    let input = inputWords(sep: ["\n"], line: "\n\n")
    var a1 = 0
    var a2 = 0
    
    a1 = (input.map { ($0.map { Int($0)! }).sum() }).max()!
    
    a2 = (input.map { ($0.map { Int($0)! }).sum() }).sorted().last(3).sum()

    printAnswer(a1, test: 24000, real: 69795)
    printAnswer(a2, test: 45000, real: 208437)
}
