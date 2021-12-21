vetor=[]

conteudo=""
puts "Serão necessários digitar 5 valores separadamente"

for conteudo in 0..4 do
    
    puts "Digite o valor inteiro: "

    vetor <<  gets.chomp.to_i

end

soma=0

vetor.each do |controle|

soma=aux+controle
    
end
puts "#{vetor}"   
puts "A soma dos conteúdos do vetor é: #{aux}"