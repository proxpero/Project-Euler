//
//  problem_095.swift
//  project_euler
//
//  Created by Todd Olsen on 4/4/16.
//  Copyright © 2016 Todd Olsen. All rights reserved.
//

import Foundation

/*


 The proper divisors of a number are all the divisors excluding the number itself. For example, the proper divisors of 28 are 1, 2, 4, 7, and 14. As the sum of these divisors is equal to 28, we call it a perfect number.

Interestingly the sum of the proper divisors of 220 is 284 and the sum of the proper divisors of 284 is 220, forming a chain of two numbers. For this reason, 220 and 284 are called an amicable pair.

Perhaps less well known are longer chains. For example, starting with 12496, we form a chain of five numbers:

12496 → 14288 → 15472 → 14536 → 14264 (→ 12496 → ...)

Since this chain returns to its starting point, it is called an amicable chain.

Find the smallest member of the longest amicable chain with no element exceeding one million.

*/

extension Int {
    var amicableChain: [Int]? {
        
        var chain: [Int] = []
        var next: Int = self
        
        repeat {
            chain.append(next)
            next = next.divisors.reduce(0) { $0 + $1 }
            if next > 1_000_000 {
                return chain.count > 1 ? chain : nil
            }
        } while next != self
        
        return chain.count > 1 ? chain : nil
    }
}

func problem_095() -> Int {
    var longest: [Int] = []
    for n in 1..<Int.max {
        
        if let chain = n.amicableChain {
            if chain.maxElement() > 1_000_000 {
                return longest.minElement()!
            }
            if chain.count > longest.count {
                longest = chain
            }
        }
    }
    fatalError()
}

