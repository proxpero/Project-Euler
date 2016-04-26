//: Cube digit pairs
//: [Cube digit pairs](https://projecteuler.net/problem=90)
/*:
Each of the six faces on a cube has a different digit (0 to 9) written on it; the same is done to a second cube. By placing the two cubes side-by-side in different positions we can form a variety of 2-digit numbers.

For example, the square number 64 could be formed:
![Two cubes showing 64](https://projecteuler.net/project/images/p090.gif)

In fact, by carefully choosing the digits on both cubes it is possible to display all of the square numbers below one-hundred: 01, 04, 09, 16, 25, 36, 49, 64, and 81.

For example, one way this can be achieved is by placing {0, 5, 6, 7, 8, 9} on one cube and {1, 2, 3, 4, 8, 9} on the other cube.

However, for this problem we shall allow the 6 or 9 to be turned upside-down so that an arrangement like {0, 5, 6, 7, 8, 9} and {1, 2, 3, 4, 6, 7} allows for all nine square numbers to be displayed; otherwise it would be impossible to obtain 09.

In determining a distinct arrangement we are interested in the digits on each cube, not the order.

{1, 2, 3, 4, 5, 6} is equivalent to {3, 6, 4, 1, 2, 5}

{1, 2, 3, 4, 5, 6} is distinct from {1, 2, 3, 4, 5, 9}

But because we are allowing 6 and 9 to be reversed, the two distinct sets in the last example both represent the extended set {1, 2, 3, 4, 5, 6, 9} for the purpose of forming 2-digit numbers.

How many distinct arrangements of the two cubes allow for all of the square numbers to be displayed?
*/

import Foundation

let squareNumbers = [(0,1), (0,4), (0,6), (1,6), (2,5), (3,6), (4,6), (8,1)]

func problem_090() -> Int {
    var count = 0
    let combinations = [0, 1, 2, 3, 4, 5, 6, 7, 8, 6].combinations(6)
    
    for (n, cube1) in combinations.enumerate() {
        c2: for cube2 in combinations[n+1..<combinations.count] {
            var success = true
            for (digit1, digit2) in squareNumbers {
                if !((cube1.contains(digit1) && cube2.contains(digit2)) ||
                    (cube1.contains(digit2) && cube2.contains(digit1))) {
                        success = false
                        continue c2
                }
            }
            if success {
                count += 1
            }
        }
    }
    return count
}