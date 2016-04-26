//
//  problem_211.swift
//  project_euler
//
//  Created by Todd Olsen on 4/4/16.
//  Copyright © 2016 Todd Olsen. All rights reserved.
//

import Foundation

/*
 
 For a positive integer n, let σ2(n) be the sum of the squares of its divisors. For example,
 
 σ2(10) = 1 + 4 + 25 + 100 = 130.
 Find the sum of all n, 0 < n < 64,000,000 such that σ2(n) is a perfect square.
 
 */

func problem_211() -> Int {
    
    var memo: [Int: [Int]] = [:]
    var perfectSquares: [Int] = []
    
    func _divisors(n: Int) -> [Int] {
        guard n > 0 else { fatalError() }
        if n == 1 { return [1] }
        if let result = memo[n] {
            return result
        }
        
        var result: Set<Int> = []
        for i in (1...n/2) {
            
            if let d = memo[i] {
                result.unionInPlace(d)
            } else {
                n % i == 0
                result.insert(i)
            }
        }

        return result.sort()
    }
    
    var result = 0
    for n in 1..<64_000_000 {
        
        let sum = _divisors(n).reduce(0) { $0 + $1 }
        if sum.isPerfectSquare {
            print("************\(n)")
            result += n
        }
        print(n)
    }

    return result
    
//    return (1..<64_000_000).filter { (_divisors($0)).reduce(0) { $0 + $1 }.isPerfectSquare }
}


