class Caixa 
    

    def initialize
        super
        @saque = 0
        @abastecer = 0
        @consultarsaldo = 0
        @valorcaixarand = rand (0..1000)
        @valorcaixa=0
        @valorsaque =0
        @cedula2cont=0
        @cedula5cont=0
        @cedula10cont=0
        @cedula20cont=0
        @cedula50cont=0
        @cedula100cont=0
        @toma9=0
        @toma8=0
        @toma6=0
    end

   
    def abastecer
         @cedula2cont=10
         @cedula5cont=10
         @cedula10cont=10
         @cedula20cont=10
         @cedula50cont=10
         @cedula100cont=10

         @controle=100

        while @controle > 0
            v=[2,5,10,20,50,100].sample

            if v == 2
                @cedula2cont=@cedula2cont +1
            elsif v == 5
                @cedula5cont=@cedula5cont +1  
            elsif v == 10
                @cedula10cont=@cedula10cont +1
            elsif v == 20
                @cedula20cont=@cedula20cont +1
            elsif v == 50
                @cedula50cont=@cedula50cont +1
            elsif v == 100
                @cedula100cont=@cedula100cont +1
            end
            @controle=@controle-1
        end


        puts "Quantidade de cédulas abastecidas.. cédula de 100: #{@cedula100cont}, cédula de 50: #{@cedula50cont}, cédula de 20: #{@cedula20cont}, cédula de 10: #{@cedula10cont}, cédula de 5: #{@cedula5cont}, cédula de 2: #{@cedula2cont}"

        puts "Valor Abastecido: #{@valorcaixa=@cedula100cont*100+@cedula50cont*50+@cedula20cont*20+@cedula10cont*10+@cedula5cont*5+@cedula2cont*2}"

        


        
        
    end
    
    def n100trocada
        @c100sub = 0

        if @cedula100cont >= 0 && @cedula50cont >= 2
            @c100sub = @cedula50cont / @cedula50cont * 2
            @cedula50cont = @cedula50cont - 2
            @nota50cont = @nota50cont + 2
            @valorsaque = @valorsaque - 100
            @valorcaixa = @valorcaixa - 100
            puts "primeiro if do 100"
        elsif @cedula50cont < 2 && @cedula20cont >= 5
            @ce100sub = @cedula20cont / @cedula20cont * 5
            @cedula20cont = @cedula20cont - 5
            @nota20cont = @nota20cont + 5
            @valorsaque = @valorsaque - 100
            @valorcaixa = @valorcaixa - 100
            puts "segundo if do 100"
        elsif @cedula20cont > 4 && @cedula10cont >= 2
            @c100sub = @cedula20cont / @cedula20cont * 4 + @cedula10cont / @cedula10cont * 2
            @cedula20cont = @cedula20cont - 4
            @nota20cont = @nota20cont + 4
            @cedula10cont = @cedula10cont - 2
            @nota10cont = @nota10cont + 2
            @valorsaque = @valorsaque - 100
            @valorcaixa = @valorcaixa - 100
            puts "3 if do 100"
        else 
            puts "Valor indisponível to no if 100"
            @valorsaque = 0 
        end
    end

    def n50trocada
        @c50sub=0

        if @cedula50cont >= 0 && @cedula20cont >= 2 && @cedula10cont >= 1
            @c50sub = @cedula20cont / @cedula20cont * 2 + @cedula10cont / @cedula10cont
            @cedula20cont = @cedula20cont - 2
            @nota20cont = @nota20cont + 2
            @cedula10cont = @cedula10cont - 1
            @nota10con = @nota10cont + 1
            @valorsaque = @valorsaque - 50
            @valorcaixa = @valorcaixa - 50
            puts "1 if do 50"

        elsif @cedula20cont >= 1 && @cedula10cont >= 3
            @c50sub = @cedula20cont / @cedula20cont + @cedula10cont / @cedula10cont * 3
            @cedula20cont = @cedula2cont - 1
            @nota20cont = @nota20cont + 1
            @cedula10cont = @cedula10cont - 3
            @nota10cont = @nota10cont + 3
            @valorsaque = @valorsaque - 50
            @valorcaixa = @valorcaixa - 50
            puts "2 if do 50"
        else
            puts "Valor indisponível to no if do 50" 
            @valorsaque = 0 
        end

    end

    def n20trocada
        @c20sub = 0

        if @cedula20cont >= 0 && @cedula10cont >= 2
            @c20sub = @cedula10cont / @cedula10cont * 2
            @cedula10cont = @cedula10cont - 2
            @nota10cont = @nota10cont + 2
            @valorsaque = @valorsaque - 20
            @valorcaixa = @valorcaixa - 20
            puts "1 if do 20"
        elsif @cedula10cont < 2 && @cedula5cont >= 4
            @c20sub = @cedula5cont / @cedula5cont * 4
            @cedula5cont = @cedula5cont - 4
            @nota5cont = @nota5con + 4
            @valorsaque = @valorsaque - 20
            @valorcaixa = @valorcaixa - 20
            puts "2 if do 20"
        else
            puts "Valor indispinível to no if do 20" 
            @valorsaque = 0 
        end

    end
        
    def n10trocada
        @c10sub = 0

        if @cedula10cont >= 0 && @cedula5cont >= 2
            @c10sub = @cedula5cont / @cedula5cont * 2
            @cedula5cont = @cedula5cont - 2
            @nota5cont = @nota5cont + 2
            puts "1 if do 10"
        elsif @cedula10cont >= 0 && @cedula2cont >= 5
            @c10sub = @cedula2cont / @cedula2cont * 5
            @cedula2cont = @cedula2cont - 5
            @nota2cont = @nota2cont + 5
            @valorsaque = @valorsaque - 10
            @valorcaixa = @valorcaixa - 10
            puts "2 if do 10"
        else
            puts "Valor indisponível to no if do 10" 
            @valorsaque = 0 
        end


    end
          

    def sacar
        @nota2cont=0
        @nota5cont=0
        @nota10cont=0
        @nota20cont=0
        @nota50cont=0
        @nota100cont=0
        @contdiv5=0
        @contdiv10=0
        @contdiv20=0
        @contdiv50=0
        @contdiv100=0
        if @valorcaixa==0
                puts "Caixa Vazio."
        

        else
                 
            puts "Digite o valor: "
                @valorsaque = gets.chomp.to_i
                
                @saqueatribuido = @valorsaque
                
                
                        if @valorsaque <= @valorcaixa 
                            
                                while @valorsaque > 0  && @valorcaixa > 0 do
                                    
                                    if @valorsaque %5 != 0 && @cedula2cont > 0
                                        @valorcaixa = @valorcaixa - 2
                                        @cedula2cont = @cedula2cont- 1
                                        @nota2cont = @nota2cont + 1
                                        @valorsaque = @valorsaque - 2
                                        puts "to no impar"

                                    elsif
                                        @valorsaque >= 100 && @cedula100cont > 0                                    
                                        @valorsaque = @valorsaque - 100
                                        @valorcaixa = @valorcaixa - 100
                                        @cedula100cont = @cedula100cont - 1
                                        @nota100cont = @nota100cont + 1

                                        puts "to no 100"

                                    
                                        
                                        
                                    elsif 
                                        
                                        @valorsaque >= 50 && @cedula50cont > 0 
                                        
                                        @valorsaque = @valorsaque - 50
                                        @valorcaixa = @valorcaixa - 50
                                        @cedula50cont = @cedula50cont - 1
                                        @nota50cont = @nota50cont + 1
                                        puts "to no 50"

                                    elsif 
                                    
                                        @valorsaque >= 20  && @cedula20cont > 0
                                        
                                        @valorsaque = @valorsaque - 20
                                        @valorcaixa = @valorcaixa - 20
                                        @cedula20cont = @cedula20cont - 1
                                        @nota20cont = @nota20cont + 1
                                        puts "to no 20"
                                        
                                                                    
                                    elsif
                                                                
                                        @valorsaque >=10 && @cedula10cont > 0
                                        
                                        @valorsaque = @valorsaque - 10
                                        @valorcaixa = @valorcaixa - 10
                                        @cedula10cont = @cedula10cont - 1
                                        @nota10cont = @nota10cont + 1
                                        puts "to no 10"


                                    elsif
                                        @valorsaque >=5 && @cedula5cont > 0
                                        @valorsaque = @valorsaque - 5
                                        @valorcaixa = @valorcaixa - 5
                                        @cedula5cont = @cedula5cont - 1
                                        @nota5cont = @nota5cont + 1
                                        puts "to no 5"

                                    
                                    elsif 
                                        @valorsaque >= 2 && @cedula2cont > 0
                                        @valorsaque = @valorsaque - 2
                                        @valorcaixa = @valorcaixa - 2
                                        @cedula2cont = @cedula2cont - 1
                                        @nota2cont = @nota2cont + 1
                                        puts "to no 2"
                                        
                                    

                                    elsif 
                                        @valorsaque > 0

                                        puts "cedulas indiponíveis para o saque"
                                        @valorsaque = 0    
                                    end
                                
                                puts " #{@valorsaque}"
                                    
                                end
                            puts "#{quantidadenatela}"

                            

                        end
                        
                        @valorsaque = @saqueatribuido
        end
                        
    end
    
    def quantidadenatela
        if @valorcaixa < @valorsaque
            puts "Valor insuficiente, favor reabastecer o caixa!" 
            @valorsaque = 0
        else
            puts "valor do caixa #{@valorcaixa}"

            puts "Quantidade de cédulas abastecidas.. cédula de 100: #{@cedula100cont}, cédula de 50: #{@cedula50cont}, cédula de 20: #{@cedula20cont}, cédula de 10: #{@cedula10cont}, cédula de 5: #{@cedula5cont}, cédula de 2: #{@cedula2cont}"
            if @cedula100cont>=0
                                        
                puts "Quantidade de notas de 100: #{@nota100cont} eu sou o cedula #{@cedula100cont}"
            end
            if @cedula50cont>=0
               
                puts "Quantidade de notas de 50: #{@nota50cont} eu sou o cedula #{@cedula50cont}"
            end
            if @cedula20cont>=0
                
                puts "Quantidade de notas de 20: #{@nota20cont} eu sou o cedula #{@cedula20cont}"
            end
            if @cedula10cont>=0
                
                puts "Quantidade de notas de 10: #{@nota10cont} eu sou o cedula #{@cedula10cont}"
            end    
            if @cedula5cont>=0
                
                puts "Quantidade de notas de 5: #{@nota5cont} eu sou o cedula #{@cedula5cont} "
            end
            if @cedula2cont>=0
                
                puts "Quantidade de notas de 2: #{@nota2cont} eu sou o cedula #{@cedula2cont}"
            end
        end        
        
    end
        
    def consulta
        @consultarsaldo

        @consulta=@valorcaixa
        puts "Saldo atual é: #{@valorcaixa}"
    end

end
    
