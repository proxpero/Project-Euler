//
//  problem_022.swift
//  project_euler
//
//  Created by Todd Olsen on 4/1/16.
//  Copyright © 2016 Todd Olsen. All rights reserved.
//

import Foundation

func problem_022() -> Int {
    return String(filename: "names.txt")
        .stringByReplacingOccurrencesOfString("\"", withString: "")
        .componentsSeparatedByString(",")
        .sort()
        .enumerate()
        .reduce(0) { $0 + (($1.index+1) * $1.element.alphabeticalValue) }
}