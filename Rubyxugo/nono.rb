puts "digite o número da tabuada: "

numero=gets.chomp.to_i
contador=0

puts "A tabuada é: "
for contador in 1..10 do
    
    resultado=contador*numero
puts "#{contador} x #{numero} = #{resultado}"

end


