class Square
  attr_accessor :value, :spot
  def initialize(val)
    @value = val
  end

  def available?
    if @value.to_i == 0
      false
    else
      true
    end
  end
end
