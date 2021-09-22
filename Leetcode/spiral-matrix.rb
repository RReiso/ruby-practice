# frozen_string_literal: true

def spiral_order(matrix)
  res = []
  until matrix.empty?
    matrix.each.with_index do |row, idx|
      res << row if idx.zero?

      if idx.between?(1, matrix.length - 2)
        res << row[-1] unless row[-1].nil?
        row.pop
      end

      res << row.reverse if idx == matrix.length - 1 && matrix.length > 1
    end
    matrix = matrix.drop(1)
    matrix.pop
    
    unless matrix.empty?
      matrix.reverse.each.with_index do |row, _idx|
        res << row[0] unless row[0].nil?
        row.shift
      end
    end
  end
  res.flatten
end

p spiral_order(
[[1],[2],[3],[4],[5],[6],[7],[8],[9],[10]])
