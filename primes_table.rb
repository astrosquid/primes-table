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
      if self.is_prime? current
        found = true
      end
    end

    @primes << current
    current
  end

  def is_prime?(n)
    return false if n <= 1

    (n - 1).downto(2) do |m|
      if n % m == 0
        return false
      end 
    end

    true
  end

  def get_table_rows
    rows = @primes
    columns = @primes
    products = []

    rows.each_with_index do |row_number, index|
      row = []
      columns.each do |column_number|
        row << column_number * row_number
      end
      products << row
    end

    products
  end

  def print_table(rows)
    max_item_length = rows.last.last.to_s.length
    column_size = max_item_length

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
    row.each do |element|
      printable = element.to_s
      filler = col_size - printable.length
      print "#{printable}#{' ' * filler} "
    end
    print "\n"
  end
end
