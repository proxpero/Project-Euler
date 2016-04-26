import Darwin

extension Int {

    var properDivisors: Set<Int> {
        guard self  > 0 else { fatalError() }

        if self == 1 { return [1] }
        if self == 2 { return [1] }
        if self == 3 { return [1] }

        var divisors: Set<Int> = [1]
        let end = Int(sqrt(Double(self)))
        for i in (2...end) {

            if self % i == 0 {
//                print("\(self) / \(i) == 0")
                divisors.insert(i)
                divisors.insert(self/i)
            }
        }

        return divisors
//        return divisors.filter { $0 != (end*end) }
    }

    public var isPerfect: Bool {
        return self == properDivisors.reduce(0) { $0 + $1 }
    }

    public var isAbundant: Bool {
        return self < properDivisors.reduce(0) { $0 + $1 }
    }

    public var isDeficient: Bool {
        return self > properDivisors.reduce(0) { $0 + $1 }
    }
}

for i in (1...50) {
    print("\(i): \(i.properDivisors.reduce(0) { $0 + $1 }) \(i.isAbundant)")
}

//let x = 8.properDivisors
