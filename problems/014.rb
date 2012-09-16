# http://projecteuler.net/problem=14

class Collatz
  
  @@chain_lengths = { 1 => 1 }

  def get_collatz_next_step(n)
    return 1 if n <= 1
    return n/2 if n.even?
    return 3*n + 1
  end  
  
  
  def get_chain(n)
    return [1] if n <= 1
    return get_chain(get_collatz_next_step(n)).push(n)
  end


  def get_chain_length(n)
    return 1 if n <= 1  # explicitly define endpoint in case @@chain_lengths[1] isn't properly set up
    return @@chain_lengths[n] if @@chain_lengths.has_key?(n)
    
    #recursively find chain length
    @@chain_lengths[n] = 1 + get_chain_length(get_collatz_next_step(n))
  end


  def find_seed_of_longest_chain(upper_limit)
    seed = 1
    maxlen = get_chain_length(seed)
    
    1.upto(upper_limit) do |n|
      chainlen = get_chain_length(n)
      if chainlen > maxlen
        maxlen = chainlen 
        seed = n
      end
    end
    seed
  end
  
end