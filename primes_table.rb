require 'prime'

class PrimesTable
  attr_reader :primes

  def initialize
    @primes = []
  end

  def find_n_primes(n)
    while n > 0
      self.find_next_prime
      n -= 1
    end

    @primes
  end

  def find_next_prime
    if @primes.empty? 
      @primes << 2
      return 2 
    end 

    current = @primes.last
    found = false

    while !found
      current += 1
      if Prime.prime? current
        found = true
      end
    end

    @primes << current
    current
  end
end
