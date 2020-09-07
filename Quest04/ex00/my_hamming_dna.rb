#difference between two DNA strands
def hamming_dna(dna_1, dna_2)
  counter = 0
  dna_1.bytes.each_with_index{
    |byte, i| counter +=1 if byte != dna_2.bytes[i]
  }
  return counter
end
puts hamming_dna("", "")