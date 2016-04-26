//
//  main.swift
//  project_euler_010
//
//  Created by Todd Olsen on 10/14/15.
//  Copyright © 2015 Todd Olsen. All rights reserved.
//
import Foundation

func problem_010() -> Int {
    let list = primes(2_000_000)
    print(list)
    return list.reduce(0){ $0 + $1 }

//    v1
//    var sum = 0
//    for i in (2..<2_000_000) {
//        if isPrime(i) {
//            sum += i
//        }
//    }
//    return sum
}

//public func evaluateBlock(block: () -> Int) {
//    let start   = NSDate()
//    let result  = block()
//    let end     = NSDate()
//    
//    let timeInterval: Double = end.timeIntervalSinceDate(start)
//    print("solution of \(result) reached in \(timeInterval) seconds")
//}
//
//public func isPrime(n: Int) -> Bool {
//    guard n > 0 else { return false }
//    if n == 1 { return false }
//    else if n == 2 { return true }
//    else {
//        if n % 2 == 0 { return false }
//        for i in 3.stride(through: sqrt(n), by: 2) {
//            if n % i == 0 { return false }
//        }
//        return true
//    }
//}
//
//public func isPrimeList(limit: Int) -> [Bool] {
//    //  Sieve of Eratosthenes
//    var sieve = Array<Bool>(count: limit + 1, repeatedValue: true)
//    sieve[0] = false
//    sieve[1] = false
//    for i in (2..<sqrt(limit) + 1) {
//        if sieve[i] {
//            // begining at index i^2 (values at lower indices should already have been determined) values as false (not-prime) at indices which are multiples of `i`.
//            for j in (i * i).stride(to: sieve.count, by: i) {
//                sieve[j] = false
//            }
//        }
//    }
//    return sieve
//}
//
//public func primes(limit: Int) -> [Int] {
//    let list = isPrimeList(limit)
//    var ps = [Int]()
//    for (p, v) in list.enumerate() {
//        if v {
//            ps.append(p)
//        }
//    }
//    return ps
//}