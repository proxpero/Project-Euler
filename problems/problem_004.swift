//: [Largest Palindrome Product](https://projecteuler.net/problem=4)
/*:
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
*/

import Foundation
//import Polyhedron

public func problem_004() -> Int {
    var result = 0
    for i in (100...999) {
        for j in (100...999) {
            let p = i * j
            if p.isPalindrome && p > result {
                result = p
            }
        }
    }
    return result
}