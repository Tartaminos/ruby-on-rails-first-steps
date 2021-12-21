nomes=["joão","josé","maria","adelaide","peterson","avenido","avenida"]

puts"Digite o nome da pesquisa: "
    

pesquisa=gets.chomp

encontrei = false

=begin nomes.each do |percorre|
    if percorre == pesquisa
        encontrei=true 
        
    break 

    
    end
end
    if encontrei 
        puts "Nome Encontrado"
    else
        puts"Nome não encontrado"
    end 

=end

if nomes.include?(pesquisa)
    puts "Encontrado"
else
    puts"Não encontrado"
end