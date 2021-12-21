vetor=[]

conteudo=""
puts "Serão necessários digitar 5 valores separadamente"

for conteudo in 0..4 do
    
    puts "Digite o valor inteiro: "

    vetor <<  gets.chomp.to_i

end

soma=0

vetor.each do |controle|

soma=soma+controle
    
end
puts "#{vetor}"   
puts "A soma dos conteúdos do vetor é: #{soma}"

puts "O vetor será agora ordenado.."


aux=0

for i in 0..4 do
    for j in 0..4 do
        if vetor[i] < vetor[j]
            aux = vetor [i]
            vetor [i] = vetor [j]
            vetor [j] = aux
        end


    end
end        

puts "#{vetor}"