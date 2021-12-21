puts "Digite o primeiro número "

fnumb=gets.to_i

puts "Digite o segundo número "

snumb=gets.to_i

puts "Digite o terceiro número "

tnumb=gets.to_i

if fnumb > snumb && fnumb > tnumb
    puts "o #{fnumb} é o maior"
elsif snumb > fnumb && snumb > tnumb
         puts "o #{snumb} é o maior"
elsif tnumb > snumb && tnumb > fnumb
            puts "o #{tnumb} é o maior"
end