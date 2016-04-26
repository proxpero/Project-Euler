import Foundation

public func evaluateBlock(block: () -> Int) {
    let start   = NSDate()
    let result  = block()
    let end     = NSDate()
    
    let timeInterval: Double = end.timeIntervalSinceDate(start)
    print("solution of \(result) reached in \(timeInterval) seconds")
}

extension UnicodeScalar: ForwardIndexType {
    public func successor() -> UnicodeScalar {
        return UnicodeScalar(value + 1)
    }
}

extension String {
    
    public init(filename: String, encoding: UInt = NSUTF8StringEncoding) {
        let content = try! NSString(contentsOfFile: filename, encoding: encoding)
        self = content as String
    }

    public var unicodeScalarCodePoint: UInt32 {
        let scalars = self.unicodeScalars
        return scalars[scalars.startIndex].value
    }

    static let alphabet = ("A"..."Z").map { String($0) }
    var alphabeticalValue: Int {
        return self.characters.map { String($0) }.reduce(0) { $0 + String.alphabet.indexOf($1)! + 1 }
    }
}

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
    
    /// Returns the sum of the squares of the divisors of `self` (including `self`).
    var sumOfSquaresOfDivisors: Int {
        return divisors.map { $0 * $0 }.reduce(0, combine: +)
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
        var divisors = (1...self/2).filter { self % $0 == 0 }
        divisors.append(self)
        return divisors
    }
    
    var properDivisors: [Int] {
        guard self  > 0 else { fatalError() }
        if    self == 1      { return [1]   }
        return (1...self/2).filter { self % $0 == 0 }
    }
    
    var amicableCounterpart: Int? {
        let candidate = properDivisors.reduce(0) { $0 + $1 }
        if self == candidate { return nil }
        if self == (candidate.properDivisors.reduce(0) { $0 + $1 }) {
            return candidate
        }
        return nil
    }
    
    var hasAmigo: Bool {
        return self.amicableCounterpart != nil
    }
    
    var isPerfectSquare: Bool {
        if self == 0 { return true }
        let n = Int(sqrt((Double(self) + 0.5)))
        return n * n == self
    }
    
    static func triangularNumber(n: Int) -> Int {
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
        return test == round(test)
    }
    
    // Hn=n(2n−1), e.g. 1, 6, 15, 28, 45, ...
    var isHexagonalNumber: Bool {
        let test = (sqrt(1.0 + 8.0 * Double(self)) + 1.0) / 4.0
        return test == round(test)
    }
    
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


func binomial(n: Int, k: Int) -> Int {
    guard k > 0 && n > k else { fatalError() }
    return Int((n.factorial / k.factorial) / (n - k).factorial)
}

extension Array {
    /// returns the `nCr` combinations of the elements of `Self`
    func combinations(n: Int, prefix: [Element] = [], start: Index = 0) -> [[Element]] {
        guard n > 0 else { return [prefix] }
        guard start < self.count else { return [] }
        
        let first = self[start]
        return self.combinations(n-1, prefix: prefix + [first] , start: start+1) + self.combinations(n, prefix: prefix, start: start+1)
    }
}


public func isPrimeList(limit: Int) -> [Bool] {
    //  Sieve of Eratosthenes
    var sieve = Array<Bool>(count: limit + 1, repeatedValue: true)
    sieve[0] = false
    sieve[1] = false
    for i in (2..<sqrt(limit) + 1) {
        if sieve[i] {
            // begining at index i^2 (values at lower indices should already have been determined) values as false (not-prime) at indices which are multiples of `i`.
            for j in (i * i).stride(to: sieve.count, by: i) {
                sieve[j] = false
            }
        }
    }
    return sieve
}

public func primes(limit: Int) -> [Int] {
    let list = isPrimeList(limit)
    var ps = [Int]()
    for (p, v) in list.enumerate() {
        if v {
            ps.append(p)
        }
    }
    return ps
}

public func sqrt(n: Int) -> Int {
    return Int(sqrt(Double(n)))
}

/// returns the greatest common divisor of a and b
public func gcd(a: Int, _ b: Int) -> Int {

    func _gcd(x: Int, _ y: Int) -> Int {
        if x == y   { return x }
        
        var hi = x;
        var lo = y
        
        if hi < lo { swap(&hi, &lo) }
        
        let r = hi % lo
        if r == 0 { return lo }
        
        return _gcd(lo, r)
    }
    return _gcd(a, b)
}

/// return the least common multiple of a and b
public func lcm(a: Int, _ b: Int) -> Int {
    return a / gcd(a, b) * b
}

/// returns the next lexicographic permutation of `current`
//public func permute(current: [Int]) -> [Int] {
//    var i = current.count
//    
//    //  search backwards through the array for the head index of longest, non-increasing suffix
//    //  set it to `i`
//    repeat {
//        i -= 1
//        //  if we get to the startIndex then there is no higher lexicographic permutation
//        guard i > 0 else { return [] }
//    } while (current[i - 1] >= current[i])
//    
//    //  the 'pivot' will be the value at index i - 1
//    
//    //  search through the suffix for the rightmost successor the the pivot
//    var j = current.count - 1
//    while (current[j] <= current[i - 1]) {
//        j -= 1;
//    }
//    
//    //  create a mutable copy of `current` to hold the next mutation
//    var next = current
//    
//    //  swap the pivot with its rightmost successor
//    let temp = next[i - 1]
//    next[i - 1] = next[j]
//    next[j] = temp
//    
//    //  reverse the suffix (in effect sorting the suffix in non-decreasing order)
//    j = next.count - 1
//    while (i < j) {
//        let temp = next[i]
//        next[i] = next[j]
//        next[j] = temp
//        i += 1
//        j -= 1
//    }
//    return next
//}

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