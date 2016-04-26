//
//  problem_017.swift
//  project_euler
//
//  Created by Todd Olsen on 3/31/16.
//  Copyright © 2016 Todd Olsen. All rights reserved.
//

// If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

// If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

// NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

import Foundation

extension Int {
    
    static let dict = [
        1: "one",
        2: "two",
        3: "three",
        4: "four",
        5: "five",
        6: "six",
        7: "seven",
        8: "eight",
        9: "nine",
        10: "ten",
        11: "eleven",
        12: "twelve",
        13: "thirteen",
        14: "fourteen",
        15: "fifteen",
        16: "sixteen",
        17: "seventeen",
        18: "eighteen",
        19: "nineteen",
        20: "twenty",
        30: "thirty",
        40: "forty",
        50: "fifty",
        60: "sixty",
        70: "seventy",
        80: "eighty",
        90: "ninety"
    ]
    
    /// Return the English language version of the integer (supports integers [1, 999]).
    var english: String {
        
        var string = ""
        
        let hundreds = self / 100
        if hundreds > 0 {
            string += "\(Int.dict[self/100]!) hundred "
            if self % 100 != 0 { string += "and " }
        }
        
        let tens = (self - (hundreds * 100)) / 10
        
        if tens == 1 {
            string += (Int.dict[(self - (hundreds * 100))]!) + " "
            return string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        } else if tens > 1 {
            string += "\(Int.dict[tens * 10]!) "
        }
        
        let ones = (self - (hundreds * 100)) % 10
        if ones > 0 {
            string += "\(Int.dict[ones]!) "
        }
        
        return string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    /// Return the character count of the number
    var characterCount: Int {
        return self.english.stringByReplacingOccurrencesOfString(" ", withString: "").characters.count
    }
}

func problem_017() -> Int {
    return (1...999).reduce(0) { $0 + $1.characterCount } + "onethousand".characters.count
}


