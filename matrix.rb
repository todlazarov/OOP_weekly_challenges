require 'pry'
class Matrix
  def initialize(str)
    @data = str
  end

  def rows
    @data.split("\n").map{|row| row.split(' ')}.each{|row| row.map!{|str| str.to_i}}
  end

  def columns
    cols = []
    rows.each do |row|
      row.each_with_index do |val, index|
        cols[index] ||= []
        cols[index] << val
      end
    end

    cols
  end
end
