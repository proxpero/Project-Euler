//
//  problem_216.swift
//  project_euler
//
//  Created by Todd Olsen on 4/4/16.
//  Copyright © 2016 Todd Olsen. All rights reserved.
//

import Foundation

/*
 
 Consider numbers t(n) of the form t(n) = 2n^2-1 with n > 1.
 The first such numbers are 7, 17, 31, 49, 71, 97, 127 and 161.
 It turns out that only 49 = 7*7 and 161 = 7*23 are not prime.
 For n ≤ 10000 there are 2202 numbers t(n) that are prime.
 
 How many numbers t(n) are prime for n ≤ 50,000,000 ?
 
 */

extension Double {
    
    public var isPrime: Bool {
        
        guard self > 1.0 else { return false }
        if self == 2.0 { return true }
        else {
            if self % 2 == 0 { return false }
            for i in 3.0.stride(through: sqrt(Double(self)), by: 2.0) {
                if self % i == 0 { return false }
            }
            return true
        }
    }
}

func problem_216() -> Int {
    
    var count = 0
    for n in (2...10_000).map({ Double($0) }) {
        let candidate = 2.0 * pow(n, 2) - 1.0
        if candidate.isPrime { count += 1 }
    }
    return count
}


