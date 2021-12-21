puts "Digite o número"

fator=gets.chomp.to_i

contador=0
multiplicador=1

loop do 
    contador=contador+1

    multiplicador=multiplicador*contador


    break if contador == fator



end

puts "o fatorial de #{fator} é: #{multiplicador}"
