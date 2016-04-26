import Darwin

extension Int {
    
    public var length: Int {
        return String(self).characters.count
    }
    
    public var mostSignificantDigit: Int {
        let mod = (1..<self.length).reduce(1) { $0.0 * 10 } // I don't understand why `$0` is type (Int, Int)
        return self/mod
    }
    
    public var digits: [Int] {
        var result: [Int] = []
        var mod = self
        repeat {
            result.append(mod.mostSignificantDigit)
            mod = mod % Int(pow(Double(10), Double((UInt(mod.length - 1)))))
        } while mod > 0
        return result
    }
    
    public var sumOfSquareOfDigits: Int {
        return self.digits.reduce(0) { $0 + ($1 * $1) }
    }
    
    public var isPrime: Bool {
        
        guard self > 1 else { return false }
        if self == 2 { return true }
        else {
            if self % 2 == 0 { return false }
            for i in 3.stride(through: Int(sqrt(Double(self))), by: 2) {
                if self % i == 0 { return false }
            }
            return true
        }
    }
    
    public var factorial: Double {
        guard self > 0 else { return 0 }
        return (1...self).reduce(1) { $0 * Double($1) }
    }
    
    public var isPalindrome: Bool {
        let num = String(self)
        return num == String(num.characters.reverse())
    }
    
    var divisors: [Int] {
        guard self  > 0 else { fatalError() }
        if    self == 1      { return [1]   }
        return (1...self/2).filter { self % $0 == 0 }
    }
    
    var amicableCounterpart: Int? {
        let candidate = divisors.reduce(0) { $0 + $1 }
        if self == candidate { return nil }
        if self == (candidate.divisors.reduce(0) { $0 + $1 }) {
            print("\(self) is amicable")
            return candidate
        }
        return nil
    }
    
    var isPerfect: Bool {
        return self == self.divisors.reduce(0) { $0 + $1 }
    }
    

    
    
    var hasAmigo: Bool {
        return self.amicableCounterpart != nil
    }
    
}

extension Int {
    
    func rotate() -> Int {
        
        var rotated = self
        rotated.rotateInPlace()
        return rotated
        
    }
    
    mutating func rotateInPlace() {
        
        guard self > 0 else { fatalError() }
        if self < 10 { return }
        
        var ds = digits
        let first = ds.removeFirst()
        
        ds.append(first)
        self = Int(ds.map { String($0) }.reduce("") { $0 + $1 })!
        
    }
}

extension Int {
    
    var isPerfectSquare: Bool {
        
        if self == 0 { return true }
        let n = Int(sqrt((Double(self) + 0.5)))
        return n * n == self
    }
    
    static func triangleNumber(n: Int) -> Int {
        return (n * (n + 1)) / 2
    }

    static func pentagonalNumber(n: Int) -> Int {
        return (n * (3 * n - 1)) / 2
    }
    
    static func hexagonalNumber(n: Int) -> Int {
        return n * (2 * n - 1)
    }
    
    // Tn=n(n+1)/2, e.g. 1, 3, 6, 10, 15, ...
    var isTriangleNumber: Bool {
        return (8 * self + 1).isPerfectSquare
    }
    
    // Pn=n(3n−1)/2, e.g. 1, 5, 12, 22, 35, ...
    var isPentagonalNumber: Bool {
        let test = (sqrt(1.0 + 24.0 * Double(self)) + 1.0) / 6.0
        return test == Double(Int(test))
    }
    
    // Hn=n(2n−1), e.g. 1, 6, 15, 28, 45, ...
    var isHexagonalNumber: Bool {
        return (1 + (8 * self)).isPerfectSquare
    }
    
}

extension MutableCollectionType where Self.Generator.Element: Comparable, Index == Int {
    
    func permute() -> Array<Self.Generator.Element> {
        var i = self.count
        
        //  search backwards through the array for the head index of longest, non-increasing suffix
        //  set it to `i`
        repeat {
            i -= 1
            //  if we get to the startIndex then there is no higher lexicographic permutation
            guard i > 0 else { return [] }
        } while (self[i - 1] >= self[i])
        
        //  the 'pivot' will be the value at index i - 1
        
        //  search through the suffix for the rightmost successor the the pivot
        var j = self.count - 1
        while (self[j] <= self[i - 1]) {
            j -= 1;
        }
        
        //  create a mutable copy of `self` to hold the next mutation
        var next: Array<Self.Generator.Element> = Array(self)
        
        //  swap the pivot with its rightmost successor
        let temp = next[i - 1]
        next[i - 1] = next[j]
        next[j] = temp
        
        //  reverse the suffix (in effect sorting the suffix in non-decreasing order)
        j = next.count - 1
        while (i < j) {
            let temp = next[i]
            next[i] = next[j]
            next[j] = temp
            i += 1
            j -= 1
        }
        
        return next
    }
    
    mutating func permuteInPlace() {
        var i = self.count
        
        //  search backwards through the array for the head index of longest, non-increasing suffix
        //  set it to `i`
        repeat {
            i -= 1
            //  if we get to the startIndex then there is no higher lexicographic permutation
            guard i > 0 else { return }
        } while (self[i - 1] >= self[i])
        
        //  the 'pivot' will be the value at index i - 1
        
        //  search through the suffix for the rightmost successor the the pivot
        var j = self.count - 1
        while (self[j] <= self[i - 1]) {
            j -= 1;
        }
        
        //  create a mutable copy of `self` to hold the next mutation
        //            var next: Array<Self.Generator.Element> = Array(self)
        
        //  swap the pivot with its rightmost successor
        let temp = self[i - 1]
        self[i - 1] = self[j]
        self[j] = temp
        
        //  reverse the suffix (in effect sorting the suffix in non-decreasing order)
        j = self.count - 1
        while (i < j) {
            let temp = self[i]
            self[i] = self[j]
            self[j] = temp
            i += 1
            j -= 1
        }
    }
}


let divisors    = [2, 3, 5, 7, 11, 13, 17]

//func test(digits: [Int]) -> Bool {
//    var success = true
//    for (index, divisor) in divisors.enumerate() {
//        let n = (100 * digits[index + 1]) + (10 * digits[index + 2]) + (1 * digits[index + 3])
//        if n % divisor != 0 {
//            success = false
//            break
//        } else {
//            print("\(n) is divisible by \(divisor)")
//        }
//    }
//    return success
//}

//test([1,4,0,6,3,5,7,2,8,9])

func permutationsGenerator(original: [Int]) -> AnyGenerator<[Int]> {
    
    var state = original
    var first = true
    
    return AnyGenerator {
        
        if first { first = false; return state }

        var i = state.count
        
        //  search backwards through the array for the head index of longest, non-increasing suffix
        //  set it to `i`
        repeat {
            i -= 1
            //  if we get to the startIndex then there is no higher lexicographic permutation
            guard i > 0 else { return nil }
        } while (state[i - 1] >= state[i])
        
        //  the 'pivot' will be the value at index i - 1
        
        //  search through the suffix for the rightmost successor the the pivot
        var j = state.count - 1
        while (state[j] <= state[i - 1]) {
            j -= 1;
        }
        
        //  create a mutable copy of `self` to hold the next mutation
        //            var next: Array<Self.Generator.Element> = Array(self)
        
        //  swap the pivot with its rightmost successor
        let temp = state[i - 1]
        state[i - 1] = state[j]
        state[j] = temp
        
        //  reverse the suffix (in effect sorting the suffix in non-decreasing order)
        j = state.count - 1
        while (i < j) {
            let temp = state[i]
            state[i] = state[j]
            state[j] = temp
            i += 1
            j -= 1
        }
        
        return state
    }
}

extension Int {
    var amicableChain: [Int]? {

        var chain: [Int] = []
        var next: Int = self
        
        repeat {
            chain.append(next)
            next = next.divisors.reduce(0) { $0 + $1 }
        } while next != self && (next != chain.last!)
        
        return chain.count > 1 ? chain : nil
    }
}

//for n in 1000000.stride(to: 1, by: -1) {
//    print(n.amicableChain)
//}

extension Double {
    
    public var isPrime: Bool {
        
        guard self > 1.0 else { return false }
        if self == 2.0 { return true }
        else {
            if self % 2 == 0 { return false }
            for i in 3.0.stride(through: sqrt(Double(self)), by: 2.0) {
                if self % i == 0 { return false }
            }
            return true
        }
    }
}

extension Int {
    
    /// Returns the sum of the squares of the divisors of `self` (including `self`).
    var sumOfSquaresOfDivisors: Int {
        return divisors.map { $0 * $0 }.reduce(0, combine: +) + (self * self)
    }
    
}

10.divisors
10.sumOfSquaresOfDivisors






//let permutations = permutationsGenerator([0, 1, 2, 3])
//
//for p in permutations {
//    print(p)
//}

"a".unicodeScalarCodePoint


//func problem_095() -> Int {
//    
//    var longest: [Int] = []
//    for n in (1..<1_000_000) {
//        
//        //        print("testing \(n)")
//        var chain: [Int] = []
//        var next: Int? = n
//        
//        repeat {
//            chain.append(next!)
//            next = next!.amicableCounterpart
//        } while next != nil && next != chain[0]
//        
//        print("\(n)'s chain: \(chain)")
//        
//        if chain.count > longest.count {
//            longest = chain
//            //            print("new longest: \(longest)")
//        }
//    }
//    
//    return longest.minElement()!
//}
//
//problem_095()
