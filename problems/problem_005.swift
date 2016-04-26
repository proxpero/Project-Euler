//: [Smallest Multiple](https://projecteuler.net/problem=5)
/*:
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
*/

import Foundation

func calculate() -> Int {
    
    var m = 2
    for i in (3...20) {
        m = lcm(m, i)
    }
    return m
}