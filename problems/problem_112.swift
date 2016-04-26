//
//  problem_112.swift
//  project_euler
//
//  Created by Todd Olsen on 3/25/16.
//  Copyright © 2016 Todd Olsen. All rights reserved.
//

/*
 
 Working from left-to-right if no digit is exceeded by the digit to its left it is called an increasing number; for example, 134468.
 
 Similarly if no digit is exceeded by the digit to its right it is called a decreasing number; for example, 66420.
 
 We shall call a positive integer that is neither increasing nor decreasing a "bouncy" number; for example, 155349.
 
 Clearly there cannot be any bouncy numbers below one-hundred, but just over half of the numbers below one-thousand (525) are bouncy. In fact, the least number for which the proportion of bouncy numbers first reaches 50% is 538.
 
 Surprisingly, bouncy numbers become more and more common and by the time we reach 21780 the proportion of bouncy numbers is equal to 90%.
 
 Find the least number for which the proportion of bouncy numbers is exactly 99%.
 
 */

func problem_112() -> Int {
    
    var bouncyCount     = 0
    var currentNumber   = 0
    
    enum Direction {
        case Increasing
        case Decreasing
    }
    
    repeat {
        currentNumber += 1

        let digits = String(currentNumber).characters.map { String($0) }
        var direction: Direction? = nil
        
        digitTest: for (index, digit) in digits.enumerate() { // The labeled control flow break isn't necessary but it makes me feel safer. 😊
            guard index+1 < digits.endIndex else { break }
            
            let nextDigit = digits[index+1]
            
            if nextDigit > digit { // Increasing
                if direction == nil {
                    direction = .Increasing
                } else if direction! == .Decreasing {
                    bouncyCount += 1
                    break digitTest
                }
            }
                
            else if digit > nextDigit { // Decreasing
                if direction == nil {
                    direction = .Decreasing
                } else if direction! == .Increasing {
                    bouncyCount += 1
                    break digitTest
                }
            }
        }

    } while (Double(bouncyCount)/Double(currentNumber)) != 0.99
    
    return currentNumber // answer: 1587000
}


