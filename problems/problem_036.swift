//
//  problem_036.swift
//  project_euler
//
//  Created by Todd Olsen on 4/2/16.
//  Copyright © 2016 Todd Olsen. All rights reserved.
//

import Foundation

func problem_036() -> Int {
    
    var result = 0
    for n in (1..<1_000_000).filter({ $0.isPalindrome }) {
        let bin = String(n, radix: 2)
        if bin == (bin.characters.reverse().reduce("") { $0 + String($1) }) {
            result += n
        }
    }
    return result
}