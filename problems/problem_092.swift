/*
A number chain is created by continuously adding the square of the digits in a number to form a new number until it has been seen before.

For example,

44 → 32 → 13 → 10 → 1 → 1
85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89

Therefore any chain that arrives at 1 or 89 will become stuck in an endless loop. What is most amazing is that EVERY starting number will eventually arrive at 1 or 89.

How many starting numbers below ten million will arrive at 89?
*/

func problem_092() -> Int {

    var eightynines = 0
    
    for n in (1 ..< 10_000_000) {
        var sum = n
        repeat {
            sum = sum.sumOfSquareOfDigits
        } while (sum != 1) && (sum != 89)

        if sum == 89 { eightynines += 1 }
    }
    return eightynines
}



