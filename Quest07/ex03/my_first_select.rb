require "csv"
class MyFirstSelect
  def initialize(filename_db)
    @filename = filename_db
    @data = []
  end

  def where(column_name, criteria)
    CSV.foreach(@filename, :headers => true) do |row|
      get_hash = row.to_hash
      if  get_hash [column_name] == criteria
        @data << get_hash
      end
    end
    @data
  end
end

# accepted_formats = [".csv"]
# p Dir.pwd
# Dir.each_child(".") {|x| puts (accepted_formats.include? File.extname(x) ) ? x : "not csv"}

inst = MyFirstSelect.new("nba_player_data.csv")
p inst.where("name", "Andre Brown")

