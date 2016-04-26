/*
2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
*/

import Foundation

//func powerDigitSum(base: Int, exponent: Int) -> Int {
//    guard base > 0 && exponent > 0 else { return 0 }
//    var digits = [Int]()
//    
//    for i in 1...exponent {
//        let d = (i * i) % 10
//        digits.append(d)
//        
//    }
//    
//    
//}

let b: Double = pow(2, 15)

func problem_016() -> Int {
    var b = "1"
    for _ in 1...1000 {
        b += "0"
    }
    let d = Int(strtoul(b, nil, 2))
    return d
}