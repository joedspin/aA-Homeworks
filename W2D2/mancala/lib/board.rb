STONECUPS = [0,1,2,3,4,5,7,8,9,10,11,12]

require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new() }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    STONECUPS.each do |i| 
      4.times { cups[i] << :stone }
    end
  end

  def valid_move?(start_pos)
    raise Exception.new("Invalid starting cup") if cups[start_pos].nil?
    raise Exception.new("Starting cup is empty") if STONECUPS.include?(start_pos)
    true
  end

  def make_move(start_pos, current_player_name)
    i = start_pos
    stones = cups[start_pos]
    cups[start_pos] = []
    until stones.empty?
      i += 1
      i = 0 if i > 13
      case i
      when 6
        cups[i] << stones.pop if current_player_name == @name1
      when 13
        cups[i] << stones.pop if current_player_name == @name2
      else
        cups[i] << stones.pop
      end
    end
    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns
    # :switch, :prompt, or ending_cup_idx
      return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
      return :switch if cups[ending_cup_idx].count == 1
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
    cups[0..5].all? { |stones| stones.count == 0 } ||
    cups[7..12].all? { |stones| stones.count == 0 }
  end

  def winner
    if cups[6].count == cups[13].count
      return :draw
    else
      return @name1 if cups[6].count > cups[13].count
    end
    @name2
  end
end
