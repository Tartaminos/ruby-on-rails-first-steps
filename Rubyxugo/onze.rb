loop do
    puts "FALA ALGUMA COISA"

    frase=gets.chomp

    
    sorteio=rand(1930..1950)
    
    if frase == frase.upcase
        puts "NÃO, EU ESQUECI EM #{sorteio}"
    else
        puts "QUE?!? FALA MAIS ALTO!"
    end
    break if frase == "TCHAU"

end
