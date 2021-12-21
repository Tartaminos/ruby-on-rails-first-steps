vetor=[]

conteudo=""
puts "Serão necessários digitar 5 valores separadamente"

for conteudo in 0..4 do
    
    puts "Digite o valor inteiro: "

    vetor <<  gets.chomp.to_i

end

puts "Os números são: #{vetor}"