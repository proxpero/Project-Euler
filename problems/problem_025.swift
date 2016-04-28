//
//  problem_025.swift
//  project_euler
//
//  Created by Todd Olsen on 4/1/16.
//  Copyright © 2016 Todd Olsen. All rights reserved.
//


// WARNING: This solution overflows. It would give the correct answer otherwise. :)
func problem_025() -> Int {

    var index = 0
    var state = (0, 1)
    let fibs = AnyGenerator<Int> {
        defer {
            state = (state.1, state.0 + state.1)
            index += 1
        }
        return state.1
    }

    while let fib = fibs.next() {
        if String(fib).characters.count == 1000 { break }
    }

    return index

}