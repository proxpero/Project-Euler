//: [10001st prime](https://projecteuler.net/problem=7)
/*:
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
*/
func problem_007() -> Int {
    var count = 0
    for p in (2..<Int.max) {
        if p.isPrime {
            count += 1
        }
        if count == 10_001 { return p }
    }
    return 0
}