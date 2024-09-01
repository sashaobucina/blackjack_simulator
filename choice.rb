require_relative "player_move"

class Choice
  attr_reader :action, :win_probability

  def initialize(action:, win_probability:)
    @action = action
    @win_probability = win_probability
  end

  def stay?
    action == :stay
  end

  def hit?
    action == :hit
  end

  def move
    if hit?
      PlayerMove.new(:hit)
    else
      PlayerMove.new(:stay)
    end
  end

  def to_s
    "#{action} (Win probability = #{win_probability * 100}%)"
  end
end