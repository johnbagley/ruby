class RockPaperScissors
  attr_accessor :moves

  def initialize
    @moves = {:rock => [0, -1, 1, 1, -1], :paper => [1, 0, -1, -1, 1], :scissors => [-1, 1, 0, 1, -1], :lizard => [-1, 1, -1, 0, 1], :spock => [1, -1, 1, -1, 0]}
    @wins = 0
    @losses = 0
    @ties = 0
    @player_tendencies = {:rock => 0, :paper => 0, :scissors => 0, :lizard => 0, :spock => 0 }
  end

  def play
    show_instructions
    select_weapons
    player_quit?
    puts @player_tendencies
  end

  def show_game_results
    print "#{@wins} Wins, #{@losses} Losses, #{@ties} Ties"
    puts
  end

  def player_quit?
    if @player_weapon != 'quit'.downcase
      show_weapon_selections
      show_winner
    else
      puts
      show_game_results
      exit
    end
  end

  def show_winner
    winner =  moves[@player_weapon.to_sym][@weapons[@selection]]
    if
      winner > 0
      @wins = @wins + 1
      print 'YOU WON!  '
    elsif
      winner < 0
      @losses = @losses + 1
      print 'YOU LOST!  '
    elsif
      winner == 0
      @ties = @ties + 1
      print "IT'S A TIE!  "
    end
    print show_game_results
    puts
  end

  def show_weapon_selections
    puts "You picked: #{@player_weapon.capitalize}"
    print "Computer picks: #{computer_move.to_s.capitalize}"
    puts
  end

  def computer_move
    @weapons = {:rock => 0, :paper => 1, :scissors => 2, :lizard => 3, :spock => 4}
    if @player_tendencies[@player_weapon.to_sym] > 2
      moves.select { |key, value| value < 1  }
      @selection = moves.keys.sample
    else
      @selection = @weapons.keys.sample
    end
  end

  def update_player_tendencies
    @player_tendencies[@player_weapon.to_sym] += 1
  end

  def select_weapons
    puts 'Enter your move, (or type "quit" to exit.)'
    print '>> '
    @player_weapon = gets.strip.downcase
    update_player_tendencies
    computer_move
  end

  def show_instructions
    puts 'Make a move.  Type Rock, Paper, Scissors, Lizard, or Spock'
  end

  game = RockPaperScissors.new
  until @player_weapon == "QUIT".downcase
    game.play
  end
end
