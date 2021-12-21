puts "Qual a idade: "

idade=gets.chomp.to_i

case idade
when 0..9
    puts "Criança"
when 10..13
    puts "Pre-adolescente"
when 14..17
    puts "Adolescente"
when 18..29
    puts "Jovem Adulto"
when 30..60
    puts "Adulto"
else
    puts "Idoso"

end