class Player
  def initialize(board,piece)
    @board = board
    @piece = piece
  end

  def play(spot)
    if @board.squares[spot].available?
      @board.squares[spot].value = @piece
      @board.player_presence << spot
      @board.moves += 1
      true
    else
      false
    end
  end
end
