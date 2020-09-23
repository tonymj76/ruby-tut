#difference between two DNA strands
def hamming_dna(dna_1, dna_2)
  return -1 if dna_1.size != dna_2.size
  counter = 0
  dna_1.bytes.each_with_index{
    |byte, i| counter +=1 if byte != dna_2.bytes[i]
  }
  return counter
end
puts hamming_dna("", "")
puts hamming_dna("GGACGGATTCTG", "AGG")
puts hamming_dna("ACCAGGG", "ACTATGG")
puts hamming_dna("GGACTGA", "GGACTGA")
