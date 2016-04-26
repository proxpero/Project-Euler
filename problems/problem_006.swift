//: [Sum square difference](https://projecteuler.net/problem=6)
/*:
The sum of the squares of the first ten natural numbers is,

1^2 + 2^2 + ... + 10^2 = 385
The square of the sum of the first ten natural numbers is,

(1 + 2 + ... + 10)^2 = 55^2 = 3025
Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
*/

import Darwin

func problem_006() -> Int {
    
    let r = (1...100)
    let x = pow(Double(r.reduce(0){ $1 + $0 }), 2.0)
    return Int(x) - (r.map{ $0 * $0 }.reduce(0){ $0 + $1 })
}