describe 'Board' do
  describe '::new' do
    let(:board) {Board.new('x')}
    it 'gets initialized with a user piece' do
      expect{Board.new("x")}.to_not raise_error
    end
    it 'makes squares upon initialization' do
      expect(board.squares.values[0]).to be_a Square
      expect(board.squares.values.length).to eq(9)
    end
  end
  describe 'to_s' do
    let(:board) {Board.new('x')}
    it 'Prints the board' do
      expect(board.to_s).to include('1|2|3')
    end

    it 'updates display when the computer plays' do
      output = capture_stdout do
        board.computer_play
      end
      expect(output).to include('My turn:')
      expect(output).to include('o')
    end
  end
  describe 'has_winner' do
    let(:board) {Board.new('x')}
    it 'does not check until there is a possiblity that someone won' do
      expect(board.has_winner).to eq(nil)
    end
    it 'returns a false if there is not a winner' do
      board.moves = 6
      expect(board.has_winner).to eq(false)
    end
    it 'returns a winning message if the player won' do
      board.moves = 6
      board.player_presence = [1,2,3]
      expect(board.has_winner).to eq('You win! :D')
    end
    it 'knows if theres a tie' do
      board.moves = 9
      expect(board.has_winner).to eq("It's a tie!")
    end
  end
  describe 'computer_play' do
    let(:board) {Board.new('x')}
    it 'does not run if there is a winner' do
      board.moves = 6
      board.player_presence = [1,2,3]
      output = capture_stdout do
        board.computer_play
      end
      expect(output).to eq('')
    end
    it 'updates moves' do
      output = capture_stdout do
        board.computer_play
      end
      expect(board.moves).to eq(1)
    end
  end
end
