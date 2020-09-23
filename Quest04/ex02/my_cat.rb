def my_cat()
  files = ARGV
  return "" if files.empty?
  files.each { |file| puts File.read(file)}
end
my_cat