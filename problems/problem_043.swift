//: [Sub-string Divisibility](https://projecteuler.net/problem=43)
/*:
The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.

Let d[1] be the 1st digit, d[2] be the 2nd digit, and so on. In this way, we note the following:

* d[2]d[3]d[4]  = 406 is divisible by 2
* d[3]d[4]d[5]  = 063 is divisible by 3
* d[4]d[5]d[6]  = 635 is divisible by 5
* d[5]d[6]d[7]  = 357 is divisible by 7
* d[6]d[7]d[8]  = 572 is divisible by 11
* d[7]d[8]d[9]  = 728 is divisible by 13
* d[8]d[9]d[10] = 289 is divisible by 17

Find the sum of all 0 to 9 pandigital numbers with this property.
*/

import Cocoa

public func problem_043() -> Int {
    
    var result   = 0
    let divisors = [2, 3, 5, 7, 11, 13, 17]
    
    func test(digits: [Int]) -> Bool {
        var success = true
        for (index, divisor) in divisors.enumerate() {
            let n = (100 * digits[index + 1]) + (10 * digits[index + 2]) + (1 * digits[index + 3])
            success = (n % divisor == 0)
            if !success { break }
        }
        return success
    }
    
    for permutation in permutationsGenerator(Array(0...9)) {
        if test(permutation) {
            result += permutation.reduce(0) { 10 * $0 + $1 }
        }
    }
    
    return result
}
