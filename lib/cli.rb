class Cli

  def game
    while !@done
      puts "Welcome to TIC TAC TOE!\nWould you like to be x or o?"
      piece = gets.chomp.downcase
      new_game(piece)
      while !@board.has_winner
        round
      end
      puts @board.winner
      puts 'Play again? (yes/no)'
      inp = gets.chomp
      quit if inp == 'no'
    end
  end

  private
  def new_game(piece)
    @board = Board.new(piece)
    @player = Player.new(@board,piece)
    @done = false
    puts @board
  end

  def round
    puts 'Enter the number of the spot you want to play:'
    inp = gets.chomp
    if @player.play(inp.to_i)
      puts @board
      @board.computer_play
    else
      puts "That spot is taken, please choose an available spot"
    end
  end

  def quit
    puts 'See ya later'
    @done = true
  end

end
