class Player

def initialize(name)
    @name = name
    @lives = 3
    @score
end

def getName
    @name
end 

def getUserInput
    gets.chomp
end

def deductLife
    @lives -= 1
end

def checkLife
    @lives
end 
    


end