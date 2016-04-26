//: [Special Pythagorean triplet](https://projecteuler.net/problem=9)
/*:
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a^2 + b^2 = c^2
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
*/
func problem_009() -> Int {
    
    let perimeter = 1000
    for a in (1..<perimeter/3) {        //  `a` (the smallest side) can't be larger than one-third the perimeter (e.g. 332 < 333 < 335)
        for b in (a..<perimeter/2) {    //  `b` can't be larger than half the perimeter (e.g. 1 < 499 < 500)
            let c = perimeter - a - b
            if (a*a + b*b) == c*c {
                return a * b * c
            }
        }
    }
    fatalError()
}