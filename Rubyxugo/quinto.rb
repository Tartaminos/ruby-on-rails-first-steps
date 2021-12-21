puts "Digite um número para saber se é par ou impar: "

fnumb= gets.chomp.to_i

snumb=2

resto= fnumb%snumb

if resto == 1
    puts "o número é ímpar"
else
    puts "o número é par"
end