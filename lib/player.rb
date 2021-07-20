require 'pry'

class Player #Détermine le joueur
  attr_accessor :name, :life_points

  #Fonction qui permet d'initialiser le nom du joueur et son nombre de points de vie
  def initialize(player_name) 
    @life_points = 10
    @name = player_name
    
  end 
 
  #On affiche le nombre de points de vie
  def show_state
    puts "#{@name} a #{@life_points} points de vie..."
  end

  def gets_damage(damages)
    @life_points -= damages
    if @life_points <= 0
      puts "#{@name} is fucking dead"
    else 
      return @life_points
    end
  end 

  def attacks(player)
    puts "Mama, #{@name} attaque #{player.name}"
    coup_dans_le_dos = compute_damage
    player.gets_damage(coup_dans_le_dos)
    puts "#{coup_dans_le_dos} points en moins pour #{player.name}"
  end

    def compute_damage
      return rand(1..6)
    end

end


class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(player_name)
    @weapon_level = 1 #Niveau de l'arme à 1
    @life_points = 100 # 100 points de vie

    super(player_name) #fait appel au initialize de la classe Player
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    dice = rand(1..6)
    puts "Tu as trouvé une super arme de niveau #{dice}"
    if dice > @weapon_level
      puts "Mama, c'est une arme de qualité"
      @weapon_level = dice
    else 
      puts "Motherfuck!"
    end
  end

  def search_health_pack
    dice = rand(1..6)
    if dice == 1 
      puts "Changes rien"
    elsif 2 <= dice && dice <= 5
      puts "Tu viens de gagner un pack de 50 points de vie"
      if @life_points + 50 < 100 
        @life_points += 50
      else 
        @life_points = 100
      end 
    else 
      puts "Tu viens de gagner un pack de 80 points de vie"
      if @life_points + 80 < 100 
        @life_points += 80
      else 
        @life_points = 100
      end 
    end 
  end 



  end