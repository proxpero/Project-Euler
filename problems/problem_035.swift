//
//  problem_035.swift
//  project_euler
//
//  Created by Todd Olsen on 4/2/16.
//  Copyright © 2016 Todd Olsen. All rights reserved.
//

//extension Int {
//    
//    func rotate() -> Int {
//        
//        var rotated = self
//        rotated.rotateInPlace()
//        return rotated
//        
//    }
//    
//    mutating func rotateInPlace() {
//        
//        guard self > 0 else { fatalError() }
//        if self < 10 { return }
//        
//        var ds = digits
//        let first = ds.removeFirst()
//        
//        ds.append(first)
//        self = Int(ds.map { String($0) }.reduce("") { $0 + $1 })!
//        
//    }
//}


func problem_035() -> Int {
    
    var result = 0
    
    for n in (2 ..< 1000000).filter({ $0.isPrime }) {
        
        let rotations = String(n).characters.count
        var isPrime = true
        var r = n
        for _ in (0 ... rotations) {
            r.rotateInPlace()
            if !r.isPrime || r.digits.count != rotations {
                isPrime = false
                break
            }
        }
        if isPrime {
            print(n)
            result += 1
        }
    }

    return result
}
