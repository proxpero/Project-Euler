//
//  problem_029.swift
//  project_euler
//
//  Created by Todd Olsen on 4/26/16.
//  Copyright © 2016 Todd Olsen. All rights reserved.
//

import Foundation

infix operator ** { associativity left precedence 160 }
func ** (radix: Double, power: Double) -> Double { return pow(radix, power) }
func ** (radix: Int,    power: Int   ) -> Int { return Int(pow(Double(radix), Double(power))) }
func ** (radix: Float,  power: Float ) -> Double { return pow(Double(radix), Double(power)) }

func problem_029() -> Int {

    var seen = Set<Int>()
    for a in (2...100) {
        for b in (2...100) {
            let c = a**b
            print(c)
            seen.insert(c)
        }
    }

    return seen.count

}