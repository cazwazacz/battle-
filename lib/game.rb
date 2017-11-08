class Game

  attr_reader :player1, :player2, :turn

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = 1
  end

  def attack
    if @turn == 1
      @player2.deduct_hp
    else
      @player1.deduct_hp
    end
    switch_turn
  end

  def attacked_player
    return @player1.name if @turn == 1
    @player2.name
  end
  private

  def switch_turn
    return @turn = 2 if turn == 1
    @turn = 1
  end

end
