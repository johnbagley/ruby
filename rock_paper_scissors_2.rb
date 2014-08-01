class RockPaperScissors
  attr_accessor :moves

  def initialize
    @moves = {:rock => [0, -1, 1, 1, 1], :paper => [1, 0, -1, -1, 1], :scissors => [-1, 1, 0, 1, -1], :lizard => [-1, 1, -1, 0, 1], :spock => [1, -1, 1, -1, 0]}


  end

  def play
    show_instructions
    select_weapons
    show_weapon_selections
    show_winner
  end

  def show_winner
    winner =  moves[@player_weapon.to_sym][@weapons[@selection]]
    if
      winner > 0
      puts 'You won!'
    elsif
      winner < 0
      puts 'You lost!'
    elsif
      winner == 0
      puts "It's a tie!"
    end
  end

  def show_weapon_selections
    puts "You picked: #{@player_weapon.capitalize}"
    print "Computer picks: #{computer_move.to_s.capitalize}"
    puts
  end

  def computer_move
    @weapons = {:rock => 0, :paper => 1, :scissors => 2, :lizard => 3, :spock => 4}
    @selection = @weapons.keys.sample
  end

  def select_weapons
    print 'Enter your move: '
    @player_weapon = gets.strip.downcase
    computer_move
  end

  def show_instructions
    puts 'Make a move.  Rock, Paper, Scissors, Lizard, or Spock'
  end

  RockPaperScissors.new.play
end
