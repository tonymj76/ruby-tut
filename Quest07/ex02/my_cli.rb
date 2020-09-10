require "readline"

def my_cli
  stty_save = `stty -g`.chomp
  begin
    while line = Readline.readline('MyCli> ', true)
      p line.split[0] == "exit" ? break : line.split
    end
  rescue Interrupt => e
    system('stty', stty_save) # Restore
    exit
  end
end
my_cli