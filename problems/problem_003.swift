//: [Largest Prime Factor](https://projecteuler.net/problem=3)
/*:
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
*/

import Foundation

public func problem_003() -> Int {
    var n = 600_851_475_143
    while true {
        let p = minimumPrimeFactor(n)
        if p == n { return p }
        n /= p
    }
}

func minimumPrimeFactor(n: Int) -> Int {
    for i in (2..<Int(sqrt(Double(n)))) {
        if n % i == 0 { return i }
    }
    return n
}