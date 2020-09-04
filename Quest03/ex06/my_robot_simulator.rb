def my_robot_simulator(instruction)
  moves = {:x => 0, :y => 0, :bearing => 'north'}
  return moves if instruction.strip.empty?
  instruction.chars.each do |letter|
   case letter
   when 'R'
      case moves[:bearing]
      when "north"
        moves[:bearing] = "east"
      when "south"
        moves[:bearing] = "west"
      when "east"
        moves[:bearing] = "south"
      else 
        moves[:bearing] = "north" 
      end
    when 'L'
      case moves[:bearing]
      when "north"
        moves[:bearing] = "west"
      when "south"
        moves[:bearing] = "east"
      when "east"
        moves[:bearing] = "north"
      else 
        moves[:bearing] = "south" 
      end
    else
      case moves[:bearing]
      when "north"
        moves[:y] += 1
      when "south"
        moves[:y] -= 1
      when "east"
        moves[:x] += 1
      else 
        moves[:x] -= 1 
      end
    end
  end
  moves
end