class Tile
  attr_reader :value

  def initialize(value)
    @value = value
    @revealed = false
  end

  def to_s
    revealed? ? value.to_s : "*"
  end

  def revealed?
    @revealed
  end

  def bomb?
    @value == :b
  end
end
