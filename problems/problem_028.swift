//
//  problem_028.swift
//  project_euler
//
//  Created by Todd Olsen on 4/26/16.
//  Copyright © 2016 Todd Olsen. All rights reserved.
//

import Foundation

func problem_028() -> Int {

    func sumOfCorners(n: Int) -> Int {
        return 4*n*n - 6*n + 6
    }

    return (3...1001).filter { $0 % 2 != 0 }.reduce(1) { $0 + sumOfCorners($1) }

}