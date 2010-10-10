Greplin Challenge Solutions
===========================

The code I used to solve the [Greplin Challenge](http://challenge.greplin.com/).

All of the code is in Ruby, as that's the language I know best, and have some previous experience solving similar problems in (thanks to Project Euler).

Problem 1
---------
The hackiest version possible. Iterates over all possible substrings, and determines if they're a palindrome. If they are, check if they're longer than the current longest palindrome, in which case it will become the new longest palindrome. Return the longest palindrome found.

Problem 2
---------
This problem was really two problems in one. The first was finding the first prime fibonacci number after a certain number. To do this I created generators for both primes and the fibonacci sequence, and then generated the first fibonacci number after the given minimum. Then I use the generators to generate the appropriate numbers (if the current fibonacci number is smaller than the current prime, generate the next fibonacci number, and generate the next prime otherwise) until both the fibonacci number and the prime are equivalent, at which point I've found the first prime fibonacci number after the given minimum. 
The fibonacci number generator is a simple implementation, but I don't think much improvement could be made on it, in this case. I suppose I don't really need to keep track of the whole array of fibonacci numbers, just the previous two, but that would just improve memory, and my real bottleneck for this problem was CPU. But in retrospect, I didn't need the array in the first place, so next time I'll make sure to remove that. 
The prime number generator was terribly inefficient, and took up basically the entire running time of the script. I could be wrong, but I don't believe there's a significantly more efficient solution to it, short of pulling out a list of precomputed prime numbers. A Sieve of Eratosthenes would've been more work, for no gain in efficiency as far as I can fathom. I'd be interested in hearing a more efficient solution to this.

The second part of the problem was generating the prime factorization of an integer (specifically, the first fibonacci prime after the given minimum, +1). Again, I used a simple solution, which in this case just consisted of  running through all possible divisors, and then removing as many as possible. This solution doesn't maintain how many times a prime is a factor of the given number, but it's irrelevant to this problem, and would be trivial to add. In the future, an implementation of the Pollar-Strassen algorithm would likely be more computationally efficient. This time around, I was optimizing for programmer efficiency though.

The final solution was just the sum of the prime factors.

Problem 3:
----------
This was an interesting problem, which in the end, ended up having a rather simple solution (in my mind).

Again, this was two problems in one. The first was generating all possible subsets, which I used a rather clever inject function, monkey-patched onto the Array class, to solve. I then select'ed this down to only sets of a feasible size.

The second part was checking whether the maximum value of a given set was equivalent to the sum of the remaining elements. This was rather easily solved by sorting the set, removing the maximum value from the set, and then seeing if its equivalent to the remaining set's sum (which I monkey-patched on).
