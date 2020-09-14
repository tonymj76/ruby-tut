secret = "guess"
guess = ""
 while guess != secret
  print "Enter your guess: "
  guess = gets.chomp()
end
p "you won"