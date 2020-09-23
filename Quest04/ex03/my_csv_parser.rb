require "csv"
def my_csv_parser(filename, separator="")
  array_rows = CSV.read(filename)
  rows = separator == "" ? array_rows : array_rows
  print rows
end

my_csv_parser("./data.csv")
