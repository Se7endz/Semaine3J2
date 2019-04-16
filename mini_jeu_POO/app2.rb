# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'time'

# lignes qui appellent les fichiers lib/user.rb et lib/event.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/game'
require_relative 'lib/player'


# Maintenant c'est open bar pour tester ton application. Tous les fichiers importants sont chargés
# Tu peux faire User.new, Event.new, binding.pry, User.all, etc.

### Debut JEU / CREATION / JOUEURS
##
#

def game_creation_joueurs
    puts "------------------------------------------------"
    puts " > Bienvenue dans Virtual Fighter XVII, THP mode."
    puts "------------------------------------------------"
    print " \n>"
    puts "Entrez un nom"
    @name = gets.chomp.to_s
    print " \n>"

    @hplayer1 = HumanPlayer.new("#{@name}")
    @player1 = Player.new("Jose")
    @player2 = Player.new("Josiane")
end

#
##
### Fin JEU / CREATION / JOUEURS



### Debut JEU / LANCEMENT
##
#

def game_lancement_combat
    puts "\n Voici l'état des joueurs :\n\n "
    puts "#{@hplayer1.show_stats}\n#{@player1.show_stats}\n#{@player2.show_stats}"
    puts "\n\n Press Enter pour démarrer le combat !!"
    gets.chomp
end

#
##
### Fin JEU / LANCEMENT

### Debut JEU / FIGHT
##
#

def game_combat
    
    while @hplayer1.life_point >0 && (@player1.life_point > 0 || @player2.life_point >0)
        puts "\n\n Voici l'etat de nos joueurs"
        puts "#{@hplayer1.show_stats}"
        puts "#{@player1.show_stats}"
        puts "#{@player2.show_stats}"
        puts "\n\n"
        puts "what do you want to do ?"
            puts "a - chercher une meilleure arme"
            puts "s - chercher à se soigner"
            puts
            puts "attaquer un joueur en vue :"
            puts "1 - #{@player1.name} a #{@player1.show_state} points de vie"
            puts "2 - #{@player2.name} a #{@player2.show_state} points de vie"

            @action = gets.chomp
    
                if @action == "a"
                    @hplayer1.search_weapon
                elsif @action == "s"
                    @hplayer1.search_health_pack
                elsif @action == "1"
                    @hplayer1.attack(player_1)
                elsif @action == "2"
                    @hplayer1.attack(player_2)
                else puts "Please select option a, s, 1 or 2"
                end

                puts
                puts "A l'attaque"
                ennemies.each { |player| 
                    if @player.life_point >= 0
                        @player.attack(@hplayer1)
                    end
                }

                round += 1
                puts
                puts "Voici l'etat de nos joueurs :"
                @hplayer1.show_state
                @player2.show_state
                @player1.show_state
                puts 
            end

        end

puts "========> END OF THE GAME <=========="
puts

if @hplayer1.life_point > 0
    puts "You Win !"
elsif @hplayer1.life_point < 0
    puts "You Loooose"
end


#
##
### Fin JEU / COMBAT

### Debut PERFORM
##
#

def perform
    game_creation_joueurs
    game_lancement_combat
    game_combat

end


perform

#
##
### Fin PERFORM