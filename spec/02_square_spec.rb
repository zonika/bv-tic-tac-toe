describe 'Square' do
  let(:square) {Square.new(1)}
  describe '::new' do
    it 'must be initialized with a value' do
      expect{Square.new}.to raise_error(ArgumentError)
    end
  end
  describe 'value' do
    it 'has a value' do
      expect(square.value).to eq(1)
    end
    it 'can be changed' do
      square.value = 'x'
      expect(square.value).to eq('x')
    end
  end
  describe 'availability' do
    let(:newsquare) {Square.new(2)}
    it 'returns true if value has not been changed' do
      expect(newsquare.available?).to eq(true)
    end

    it 'returns false if value has been changed (square is occupied by an x or o)' do
      newsquare.value = 'x'
      expect(newsquare.available?).to eq(false)
    end
  end
end
