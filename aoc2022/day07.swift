//
//  day07.swift
//  aoc2022
//
//  created by chris mcelroy on 27.11.5
//

import Foundation

func d7() {
    runType = .all
    let input = inputWords()
    var a1 = 0
    var a2 = 0
    
    var fileSystem: [[String]: [Any]] = [:]
    var cur: [String] = []
    
    for line in input {
        if line.contains("cd") {
            if line.contains("..") {
                cur.removeLast()
            } else {
                cur.append(line.last!)
                fileSystem[cur] = []
            }
        } else if let n = Int(line.first!) {
            fileSystem[cur]!.append(n)
        } else if line.first! == "dir" {
            fileSystem[cur]!.append(cur + [line.last!])
        }
    }
    
    var dirList: [[String]: Int] = [:]
    
    func getDirAmount(name: [String]) -> Int {
        if let n = dirList[name] { return n }
        var total = 0
        
        for entry in fileSystem[name]! {
            if let entryInt = entry as? Int {
                total += entryInt
            } else {
                total += getDirAmount(name: entry as! [String])
            }
        }
        
        dirList[name] = total
        return total
    }
    
    for dir in fileSystem.keys {
        let n = getDirAmount(name: dir)
        if n <= 100000 {
            a1 += n
        }
    }
    
    let space = dirList[["/"]]! - 40000000
    a2 = dirList.values.filter({ $0 > space }).min()!

    printAnswer(a1, test: 95437, real: 1517599)
    printAnswer(a2, test: 24933642, real: 2481982)
    copy(a2)
}
