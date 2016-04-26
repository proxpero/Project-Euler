//: [Longest Collatz sequence](https://projecteuler.net/problem=14)
/*
The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
*/

import Foundation

var cache = [Int:Int]()

func next(n: Int) -> Int {
    if n % 2 == 0 {
        return n/2
    }
    return 3 * n + 1
}

func sequenceLength(n: Int) -> Int {
    if n == 1                   { return 1 }
    if let length = cache[n]    { return length }

    let length = 1 + sequenceLength(next(n))
    cache[n] = length
    return length
}

func problem_014() -> Int {    
    return (1..<1_000_000).map(sequenceLength).maxElement()!
}