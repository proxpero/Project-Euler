//
//  problem_023.swift
//  project_euler
//
//  Created by Todd Olsen on 4/1/16.
//  Copyright © 2016 Todd Olsen. All rights reserved.
//

extension Int {

    public var isPerfect: Bool {
        return self == properDivisors.reduce(0) { $0 + $1 }
    }

    public var isAbundant: Bool {
        return self < properDivisors.reduce(0) { $0 + $1 }
    }

    public var isDeficient: Bool {
        return self < properDivisors.reduce(0) { $0 + $1 }
    }
}

func problem_023() -> Int {

    let limit = 28124
    let abundantNumbers = (1...28123).filter { $0.isAbundant }

    var abundantSums = Array<Bool>(count: limit, repeatedValue: false)
    for i in abundantNumbers {
        for j in abundantNumbers {
            if i+j < limit { abundantSums[i+j] = true }
            else { break }
        }
    }

    return abundantSums.enumerate().filter { !$0.element }.reduce(0) { $0 + $1.index }
}