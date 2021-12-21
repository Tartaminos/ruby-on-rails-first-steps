puts "Quantos Elefantes deseja?"

elefante=gets.chomp.to_i
i=0
j=0
incomoda=''

loop do
    i=i+1
    break if i => elefante
loop do
    incomoda << 'incomodam '
    j=j+1
    break if j => i
end
    if i == 1
        puts " #{i} elefante incomoda muita gente"
    else
        puts " #{i} elefantes #{incomoda} muito mais"
    end    

end








