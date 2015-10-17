describe 'Player' do
  let(:board) {Board.new('x')}
  let(:player) {Player.new(board,'x')}
  describe '::new' do
    it 'must be initialized with a board and a piece' do
      expect{Player.new(board)}.to raise_error(ArgumentError)
    end
  end
  describe 'play' do
    before(:each) do
      player.play(1)
    end
    it 'returns false if the spot is not available' do
      board.squares[1].value = 'o'
      expect(player.play(1)).to eq(false)
    end
    it 'changes the value of the played square' do
      expect(board.squares[1].value).to eq('x')
    end
    it 'adds the spot to the player\'s array in the board class' do
      expect(board.player_presence).to include(1)
    end
    it 'increments game moves' do
      expect(board.moves).to eq(1)
    end
  end
end
