class Board
  attr_accessor :squares, :moves, :player_presence
  attr_reader :winner
  def initialize(piece)
    @player_presence = []
    @computer_presence = []
    @ppiece = piece
    if piece == 'x'
      @cpiece = 'o'
    else
      @cpiece = 'x'
    end
    @squares = {}
    (1..9).each do |num|
      @squares[num] = Square.new(num)
    end
    @moves = 0
  end

  def computer_play
    if !has_winner
      selected = available_spaces.sample
      @computer_presence << selected.value
      selected.value = @cpiece
      @moves += 1
      puts 'My turn:'
      puts self
    end
  end

  def has_winner
    if @moves < 5
      false
    else
      @winner = eval_board
    end
  end

  def to_s
    """
      #{@squares[1].value}|#{@squares[2].value}|#{@squares[3].value}
      #{@squares[4].value}|#{@squares[5].value}|#{@squares[6].value}
      #{@squares[7].value}|#{@squares[8].value}|#{@squares[9].value}
    """
  end

  private
  def available_spaces
    avail = []
    @squares.each do |k,square|
      avail << square if square.available?
    end
    avail
  end

  def eval_board
    pwin = horizontal_win?(@player_presence) || vertical_win?(@player_presence) || diagonal_win?(@player_presence)
    cwin = horizontal_win?(@computer_presence) || vertical_win?(@computer_presence) || diagonal_win?(@computer_presence)
    if pwin
      "You win! :D"
    elsif cwin
      "You lose! :("
    elsif @moves == 9
      "It's a tie!"
    else
      false
    end
  end

  def horizontal_win?(spots)
    row = spots.sort
    row.each.with_index(1) do |place,i|
      return true if place%3 == 1 && place + 1 == row[i] && place + 2 == row[i+1]
    end
    false
  end

  def vertical_win?(spots)
    mods = spots.collect do |spot|
      spot%3
    end
    if mods.count(0) == 3 || mods.count(1) == 3 || mods.count(2) == 3
      true
    else
      false
    end
  end

  def diagonal_win?(spots)
    row = spots.sort
    row.each do |place|
      # 1 5 9 diagonal
      return true if place%3 == 1 && row.include?(place+4) && row.include?(place+8)
      # 3 5 7 diagonal
      return true if place%3 == 0 && row.include?(place+2) && row.include?(place+4)
    end
    false
  end
end
