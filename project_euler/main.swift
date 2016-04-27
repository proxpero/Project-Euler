//
//  main.swift
//  project_euler
//
//  Created by Todd Olsen on 10/15/15.
//  Copyright © 2015 Todd Olsen. All rights reserved.
//

import Foundation

public typealias Problem = () -> Int

public func evaluateProblem(problem: Problem) {

    let start   = NSDate()
    let result  = problem()
    let end     = NSDate()

    print("Solution of \(result) reached in \(end.timeIntervalSinceDate(start)) seconds")

}

evaluateProblem(problem_028)
