
require "./Player"

class GameEngine

def initialize(p1Name, p2Name)
    @player1 = Player.new(p1Name)
    @player2 = Player.new(p2Name)
    @winner
    @currentNumber1
    @currentNumber2
    @round = 1
end 

def checkWinner
    if(@player1.checkLife == 0)
        @winner = @player2.getName
    else
        @winner = @player1.getName
    end
end 

def generateNumbers
    @currentNumber1 = (0..20).to_a.sample
    @currentNumber2 = (0..20).to_a.sample
end 


def playGame
    while(@player1.checkLife > 0 || @player2.checkLife > 0 )
        generateNumbers
        puts("Round #{@round}")
        puts ("player 1's turn... what is #{@currentNumber1} + #{@currentNumber2}?")
        if(@currentNumber1 + @currentNumber2 != @player1.getUserInput.to_f)
            puts("wrong! remaining lives: #{@player1.checkLife}")
            @player1.deductLife
        else
            puts("correct! you little shit")
        end
        
        generateNumbers
        puts ("player 2's turn... what is #{@currentNumber1} + #{@currentNumber2}?")
        if(@currentNumber1 + @currentNumber2 != @player2.getUserInput.to_f)
            puts("wrong! remaining lives: #{@player2.checkLife}")
            @player2.deductLife
        else
            puts("correct!")
        end

        puts("Lives left: player1: #{@player1.checkLife}, player2: #{@player2.checkLife}")
        @round += 1
    end 
    
    
    checkWinner
    puts("Someone lost!")
    puts("The winner is #{@winner} !")
end 

end



