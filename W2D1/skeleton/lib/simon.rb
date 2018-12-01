class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    system("clear")
    puts "I'll tell you a sequence of colors, then clear the screen.
    When prompted, type out the same sequence of colors.
    The game ends as soon as you don't match my pattern.

    Simon says, ""Play"""
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    @game_over = require_sequence
    round_success_message unless @game_over
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      print color + " "
      sleep (1)
    end
    system("clear")
  end

  def require_sequence
    p "Repeat the sequence: "
    player_sequence = gets.chomp.split(" ")
    player_sequence.each_with_index do |color, i|
      return true if color != @seq[i]
    end
    false
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Good job! You matched the sequence."
  end

  def game_over_message
    puts "GAME OVER"
  end

  def reset_game
    @sequence_length = 1
    @seq = []
    @game_over = false
  end
end
