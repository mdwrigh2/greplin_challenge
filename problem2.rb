
def fib_generator
  f = Fiber.new do
    i = 0
    fib = [0,1]
    Fiber.yield 0
    Fiber.yield 1
    while true
      new_fib = fib[i]+fib[i+1]
      fib << new_fib
      Fiber.yield new_fib
      i += 1
    end
  end
  return f
end

def prime_generator
  f = Fiber.new do
    n = 2
    p = []
    while true
      if p.all? { |f| n%f != 0 }
        Fiber.yield n
        p << n
      end
      n += 1
    end
  end
  return f
end

def first_fib_prime(num)

  g = fib_generator
  p = prime_generator

  fib = 0

  while fib < num
    fib = g.resume
  end

  prime = 2

  while prime != fib
    if prime > fib
      fib = g.resume
    end
    if prime < fib
      prime = p.resume
    end
  end
  return prime
end

def prime_factorization(num)
  factors = []
  p = prime_generator
  while num != 1
    prime = p.resume
    if num%prime == 0
      factors << prime
    end
    while num%prime == 0
      num = num/prime
    end
  end
  return factors
end

n = first_fib_prime(227000)

puts "First Fibonacci Prime After 227,000: " + n.to_s

pf = prime_factorization(n+1)

puts "Prime factors of " + (n+1).to_s + ": "+ pf.to_s

pfsum = pf.reduce(0) { |sum, value| sum + value}

puts "Sum of the prime factors of " + (n+1).to_s + ": " + pfsum.to_s
