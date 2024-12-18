//
//  day09.swift
//  aoc2022
//
//  created by chris mcelroy on 27.11.5
//

import Foundation

func d9() {
    runType = .all
    let input = inputWords()
    var a1 = 0
    var a2 = 0
    
    var rope1: [C2] = Array(repeating: .zero, count: 2)
    var rope2: [C2] = Array(repeating: .zero, count: 10)
    
    for move in input {
        let len = Int(move[1])!
        let dir = C2(dir: move[0][0])
        len.times {
            rope1[0] += dir
            rope2[0] += dir
            stepKnots(for: &rope1)
            stepKnots(for: &rope2)
            store(rope1.last!, 1)
            store(rope2.last!, 2)
        }
    }
    
    func stepKnots(for rope: inout [C2]) {
        for i in 1..<rope.count {
            let head = rope[i-1]
            let tail = rope[i]
            if head.crowDistance(to: tail) >= 2 {
                rope[i] += (head - tail).clamped(to: -1...1)
            }
        }
    }
    
    a1 = c2Memory[1].count
    a2 = c2Memory[2].count
    printAnswer(a1, test: 13, real: 6498)
    printAnswer(a2, test: 1, real: 2531)
//    copy(a1)
}
