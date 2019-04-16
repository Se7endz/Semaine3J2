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

    @hplayer = HumanPlayer.new("#{@name}")
    @player1 = Player.new("Jose")
    @player2 = Player.new("Josiane")
end

#
##
### Fin JEU / CREATION / JOUEURS



### Debut JEU / LANCEMENT / COMBAT
##
#

def game_lancement_combat
    puts "\n Voici l'état des joueurs :\n\n "
    puts "#{@player1.show_stats}\n#{@player2.show_stats}"
    puts "\n\n Press Enter pour démarrer le combat !!"
    gets.chomp
end

#
##
### Fin JEU / LANCEMENT / COMBAT

### Debut JEU / FIGHT
##
#

def game_combat
    
    while @name.life_point >0 && (player1.life_point > 0 || player2.life_point >0)
        puts "\n\n Voici l'etat de nos joueurs"
        puts "#{@hplayer1.show_stats}"
        puts "#{@player1.show_stats}"
        puts "#{@player2.show_stats}"
  
    end

    while @player1.life_point > 0 && @player2.life_point > 0

        puts "\n\n C'est au tour de #{@name1} d'attaquer !!\n"
        @player1.attacks(@player2)
        puts "\n\n Voici l'etat de nos joueurs"
        puts "#{@player1.show_stats}"
        puts "#{@player2.show_stats}"
        break if @player1.life_point <= 0 || @player2.life_point <= 0
        puts "\n\n C'est au tour de #{@name2} d'attaquer !!\n"
        @player2.attacks(@player1)
        puts "\n\n Voici l'etat de nos joueurs"
        puts "#{@player1.show_stats}"
        puts "#{@player2.show_stats}"
    end

    
    if @player1.life_point <= 0
        puts "\n\n GAME OVER !!!\n\n Victoire écrasante de #{@name2} !!!!\n Il a pulvérisé #{@name1}"
    else
        puts "\n\n GAME OVER !!!\n\n Victoire écrasante de #{@name1} !!!!\n Il a EXPLOSE #{@name2}"
        
    end
    puts "\n\n Press Enter pour sortir"
    gets.chomp
end

#
##
### Fin JEU / COMBAT

### Debut PERFORM
##
#

def perform
    game_creation_joueurs
    game_intro
    game_lancement_combat
    game_combat

end


perform

#
##
### Fin PERFORM