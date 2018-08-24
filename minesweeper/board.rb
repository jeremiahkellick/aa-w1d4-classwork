require_relative "tile"

class Board
  def initialize
    @grid = Array.new(9) { Array.new(9) }
    populate
  end

  def populate
    place_bombs
    fill_grid
  end

  def place_bombs
    bombs = Array.new(15) {Tile.new(:b)}
    until bombs.empty?
      pos = [rand(0...9), rand(0...9)]
      self[pos] = bombs.shift if self[pos] == nil
    end
  end

  def fill_grid
    @grid.each_index do |row_i|
      @grid[row_i].each_index do |col_i|
        pos = [row_i, col_i]
        self[pos] = generate_tile_for(row_i, col_i) if self[pos] == nil
      end
    end
  end

  def generate_tile_for(row_i, col_i)
    bombs_adj = 0

  end

  def [](pos)
    row,col = pos
    @grid[row][col]
  end

  def []= (pos, tile)
    row, col = pos
    @grid[row][col] = tile
  end

  def render
    @grid.each do |row|
      puts row.map{|tile| tile ? tile.to_s : " " }.join
    end
  end

end
