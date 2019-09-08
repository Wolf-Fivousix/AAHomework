require "player"
require "byebug"
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    self.place_stones
    @player1 = Player.new(name1, 1)
    @player2 = Player.new(name2, 2)
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each.with_index do |cup, index|
      4.times { cup << :stone } unless index == 6 || index == 13
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 13
    raise "Starting cup is empty" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = []
    cups[start_pos].length.times { stones << cups[start_pos].shift }
    current_pos = start_pos
    until stones.empty?
        current_pos += 1
        current_pos = 0 if current_pos > 13
        if current_player_name == @player1.name
          cups[current_pos] << stones.shift unless current_pos == 13
        else
          cups[current_pos] << stones.shift unless current_pos == 6
        end
    end
    render
    next_turn(current_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if cups[ending_cup_idx].length == 1
    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if cups[0..5].all? { |cup| cup.empty? }
    return true if cups[7..12].all? { |cup| cup.empty? }
    false
  end

  def winner
    return :draw if cups[6].length == cups[13].length
    cups[6].length > cups[13].length ? @player1.name : @player2.name
  end
end
