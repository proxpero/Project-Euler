//
//  problem_024.swift
//  project_euler
//
//  Created by Todd Olsen on 4/1/16.
//  Copyright © 2016 Todd Olsen. All rights reserved.
//

func problem_024() -> Int {
    var sequence = Array(0...9)
    for _ in (1..<1_000_000) {
        sequence.permuteInPlace()
    }
    return Int(sequence.reduce("") { $0 + String($1) })!
}
