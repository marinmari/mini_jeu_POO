require 'pry'

require_relative 'player'

class Game
  attr_accessor :human_player, :enemies_array

  def initialize(human_player_name)
    @human_player = HumanPlayer.new(human_player_name)
    @enemies_array = [player1 = Player.new("José"), player2 = Player.new("Josianne"), player3 = Player.new("Miguel"), player4 = Player.new("Hola")]
  end

  def kill_player(il_doit_nous_quitter)
    @enemies_array.reject! {|word| word == il_doit_nous_quitter}
  end

  def is_still_ongoing?
    if @human_player.life_points > 0 && @ennemies.length != 0
      return true 
    else 
      return false
    end
  end

  def show_players
    puts "#{@human_player.}"


  binding.pry



end