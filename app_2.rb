require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

enemies_array = []
player1 = Player.new("Josiane")
player2 = Player.new("José")

enemies_array << player1 << player2

binding.pry

def menu(enemies)

end

def choix_menu(choix)
  
end

def quit 
  puts "Ciao Ciao"
end

puts "---------------------------"
puts "Bienvenue à José et Josiane"
puts "---------------------------"

puts ""

puts "Quel est le nom de ton player ?"
humanplayer1 = HumanPlayer.new(gets.chomp)

puts enemies_array

while ( player1.life_points > 0 || player2.life_points > 0 ) && humanplayer1.life_points > 0
  puts humanplayer1.show_state
  puts "-------------------------"
  puts "Quelle action souhaites tu réaliser ?"
  puts ""
  puts "2 - chercher une meilleure arme"
  puts "3 - chercher à se soigner"
  puts ""
  puts "Attaquer un joueur en vue"
  puts "0 - #{enemies_array[0].name} qui a #{enemies_array[0].life_points} points de vie"
  puts "1 - #{enemies_array[1].name} qui a #{enemies_array[1].life_points} points de vie"
  puts "5 - quit"
  puts "-------------------------"
  choix = gets.chomp.to_i
  if choix == 0
    humanplayer1.attacks(player1)
  elsif choix == 1
      humanplayer1.attacks(player2)
  elsif choix == 2
      humanplayer1.search_weapon
  elsif choix == 3
      humanplayer1.search_health_pack
  elsif choix == 5
      quit 
  end
  
  puts "Be careful, José & Josiane are coming"

  enemies_array.each do |player|
    if player.life_points > 0
      player.attacks(humanplayer1)
    end
  end

end

puts "fin du game"
if humanplayer1.life_points > 0
  puts "You Win"
else 
  puts "You loose"
end