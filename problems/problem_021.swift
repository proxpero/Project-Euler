//
//  problem_021.swift
//  project_euler
//
//  Created by Todd Olsen on 4/1/16.
//  Copyright © 2016 Todd Olsen. All rights reserved.
//

import Foundation

func problem_021() -> Int {
    return (1..<10000).filter { $0.hasAmigo }.reduce(0) { $0 + $1 }
}