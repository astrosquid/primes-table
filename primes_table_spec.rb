require_relative './primes_table.rb'

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

    pt = PrimesTable.new
    ten = pt.find_n_primes(10)
    print ten 
  end
end

