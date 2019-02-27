# Prime Multiplication Table

A small Ruby class that prints out a multiplication table for n number of prime integers.

## Usage

```ruby
# Initialize
pt = PrimesTable.new

# Calculate the first 10 prime numbers
pt.find_n_primes 10

# Get the rows for the table
rows = pt.get_table_rows

# Print them out
pt.print_table rows

# ...or, just call this guy:
pt = PrimesTable.new 
pt.print_n_primes 10
```
