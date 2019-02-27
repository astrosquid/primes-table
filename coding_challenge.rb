require_relative './primes_table.rb'

pt = PrimesTable.new
pt.find_n_primes 10
rows = pt.get_table_rows
pt.print_table rows

puts ''

pt = PrimesTable.new
pt.print_n_primes 20
