require 'pry'

class Player
	attr_accessor :name, :life_point

	
		def initialize(name)
			@name = name
			@life_point = 10
			return @name, @life_point
		end

		def show_stats
			return "#{@name} a #{life_point} points de vie"
		end

		def gets_damage(damage)
			@damage_taken = damage.to_i
			@life_point = [@life_point.to_i - @damage_taken.to_i, 0].max
			if @life_point <= 0
				return "#{@name} est mort"
			else 
				return "Il reste #{@life_point} de vie a #{@name}"
			end
			return @life_point
		end

		def compute_damage
    		return rand(1..6)
  		end

		def attacks(a =[])
			puts "le joueur #{self.name} attaque le joueur #{a.name} et lui inflige #{dmg = compute_damage} dégats."
			a.gets_damage(dmg)
		end

	end

###
##
#
#####################APP 2.0################################


class HumanPlayer < Player
	attr_accessor :weapon_level

	def initialize(name)
		@name = name.to_s
		@life_point = 100
		@weapon_level = 1
		return @name, @life_point, @weapon_level
	end

	def show_state
		return "#{@name} a #{life_point} points de vie et une arme de niveau #{@weapon_level}"
	end

	def compute_damage
		rand(1..6) * @weapon_level
	end

	def search_weapon
		@style_weapon = rand(1..6)
		@style_weapon2 = rand(1..6)
		puts "Tu as degoté une arme de niveau : #{@style_weapon}"
		puts "Tu peux en avoir une meilleur si tu veux.. "
		puts "Allez on retente sa chance"
		puts "TADAAAAAAAAA"
		puts "Une arme de niveau #{@style_weapon2} vient de sortir !!!"
		puts "laquelle veux tu?"
		puts "Tape 1 ou 2 "
		@choise = gets.chomp.to_i
			if @choise == 1
				@weapon_level = @style_weapon
				return "Ca marche, tu gardes une arme de niveau : #{@weapon_level}"
			elsif @choise == 2
				@weapon_level = @style_weapon2
				return "A ta convenance!!... Tu as récuperer une arme de niveau #{@weapon_level}"
			elsif @choise != 1 && @choise != 2
				return "Valeur incorrect, on a dit 1 ou 2 oueshh!!"
			end
			
			end

	def search_health_pack
		@health_pack = rand(1..6)
		if @health_pack == 0
			return "Tu n'as rien eu, pas de bol!!!"
		elsif  @health_pack >= 2 && @health_pack <= 5
			@life_point = @life_point + 50
			return "Great!!, Tu obtiens 50 pv supplementaire, tu as maintenant #{@life_point} pv."
		elsif @health_pack == 6
			@life_point = @life_point + 100
			return "Alors la mon gars, va jouer au loto. Tu gagnes 100 pv!!! Tu as maintenant #{@life_point} pv."
		end
	end
end
binding.pry
