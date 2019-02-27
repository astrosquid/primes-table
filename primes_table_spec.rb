require_relative './primes_table.rb'

describe 'class PrimeTable' do 
  describe '#find_next_prime' do 
    it 'finds the prime after the given prime' do 
      pt = PrimesTable.new
      expect(pt.find_next_prime).to eq 2
      expect(pt.find_next_prime).to eq 3
    end
  end

  describe '#find_n_primes' do 
    it 'returns an array of n primes' do 
      pt = PrimesTable.new
      expect(pt.find_n_primes(2)).to eq([2, 3])

      pt = PrimesTable.new
      expect(pt.find_n_primes(3)).to eq([2, 3, 5])
    end
  end

  describe '#get_table_rows' do 
    it 'return an array of arrays where in the inner arrays are table rows' do 
      pt = PrimesTable.new 

      pt.find_n_primes(2)

      table_rows = pt.get_table_rows
      expect(table_rows.class).to eq(Array)

      table_rows.each_with_index do |row, index|
        expect(row.class).to eq(Array)

        if index == 0
          expect(row).to eq([4, 6])
        end

        if index == 1
          expect(row).to eq([6, 9])
        end
      end
    end
  end

  describe '#print_table' do 
    it 'prints out a multiplication table of primes' do 
      pt = PrimesTable.new
      pt.find_n_primes 2
      rows = pt.get_table_rows

      expected_output = "  2 3 \n2 4 6 \n3 6 9 \n"
      expect {pt.print_table rows}.to output(expected_output).to_stdout
    end
  end
end

