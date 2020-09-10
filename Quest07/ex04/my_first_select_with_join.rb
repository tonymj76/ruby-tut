require "csv"
class MyFirstSelectWithJoin
  def initialize(filename_db)
    @datas = []
    @merge = []
    CSV.foreach(filename_db, :headers => true) do |row|
      @datas << row.to_hash
    end
  end

  def where(column_name, criteria)
    @merge.each { |data|
      if data[column_name] == criteria
        p data
      end
    }
  end

  def join(colum_on_db_a, filename_db_b, column_on_db_b)
    datas = []
    CSV.foreach(filename_db_b, :headers => true) do |row|
      datas << row.to_hash
    end

    @datas.each { |data|
      datas.each{ |d|
        if data[colum_on_db_a] == d[column_on_db_b]
          @merge << data.merge(d)
        end
      }}
  end
end

# accepted_formats = [".csv"]
# p Dir.pwd
# Dir.each_child(".") {|x| puts (accepted_formats.include? File.extname(x) ) ? x : "not csv"}

inst = MyFirstSelectWithJoin.new("nba_player_data.csv")
inst.join("name", "nba_players.csv", "Player")
inst.where("birth_state", "Indiana")

