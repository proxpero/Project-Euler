//
//  problem_034.swift
//  project_euler
//
//  Created by Todd Olsen on 4/1/16.
//  Copyright © 2016 Todd Olsen. All rights reserved.
//

import Foundation


// I don't see how this will ever end...
func problem_034() -> Int {
    
    var result = 0
    for n in (3...10000) {
        
        let sum = Int(n.digits.map { $0.factorial }.reduce(0) { $0 + $1 })
        let num = Int(n.digits.reduce("") { $0 + String($1) })!
        if sum == num {
            print("\(n) -> \(sum)")
            result += sum
        }
    }
    
    return result
}