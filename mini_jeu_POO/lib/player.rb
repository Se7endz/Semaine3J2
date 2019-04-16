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
		puts "Tu as degoté une arme de niveau : #{@style_weapon}"
		puts "Veux tu garder cette arme ? "
		yesno 
	end
	def yesno(prompt = 'Continue?', default = true)
		  @a = ''
		  @s = default ? '[Y/n]' : '[y/N]'
		  @d = default ? 'y' : 'n'
		  until %w[y n].include? a
		    @a = ask("#{prompt} #{s} ") { |q| q.limit = 1; q.case = :downcase }
		    @a = d if a.length == 0
		  end
		  @a == 'y'
    end
end
binding.pry