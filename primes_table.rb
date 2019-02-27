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

    # Since our is_prime? fn
    # takes n time, this will take
    # O(mn) time, where m represents
    # the count of numbers between 
    # two primes.
    while !found
      current += 1
      if self.is_prime? current
        found = true
      end
    end

    @primes << current
    current
  end

  # This is O(n) time, since
  # we're checking all the numbers
  # beneath n. 
  # But it's portable and doesn't 
  # depend on this class for execution.
  #
  # I did look for a better answer, 
  # and found one on StackOverflow -- 
  # essentially, we'd only test numbers
  # from the sqrt of n down to 2.
  def is_prime?(n)
    return false if n <= 1

    (n - 1).downto(2) do |m|
      if n % m == 0
        return false
      end 
    end

    true
  end

  # O(n^2) time, where n is 
  # the number of primes.
  def get_table_rows
    rows = @primes
    columns = @primes
    products = []

    rows.each do |row_number|
      row = []
      columns.each do |column_number|
        row << column_number * row_number
      end
      products << row
    end

    products
  end

  def print_table(rows)
    # We want to find the max column size first...
    max_item_length = rows.last.last.to_s.length
    column_size = max_item_length

    # The headers should be just another row to 
    # #print_row, but we need something to keep 
    # the top left corner clear.
    headers = @primes
    headers.unshift(' ')
    rows.unshift(headers)

    rows.each_with_index do |row, index|
      if index > 0 
        row.unshift(@primes[index])
      end

      self.print_row(row, column_size)
    end
  end

  def print_row(row, col_size)
    # then we'll use the column size as a prefix
    # filler, so the numbers are right-justified
    # like a calculator.
    row.each do |element|
      num_string = element.to_s
      filler = col_size - num_string.length
      print "#{' ' * filler}#{num_string} "
    end
    print "\n"
  end
end
