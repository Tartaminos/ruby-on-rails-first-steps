class Carro
    attr_accessor :nome, :velocidade_maxima, :velocidade_atual, :quantidade_marchas, :marcha_atual, :ligado


    def initialize
        super
        @velocidadeatual = 0
        @velocidademaxima = 0
        @quantidademarchas = 0
        @marchaatual = 0
                
    end


    def ligar
        @ligado=true
        
        
        if @ligado == true or false && @velocidadeatual>0
            
            puts "Seu carro ja está ligado"

        end
        if @ligado==true && @velocidadeatual ==  0 
        
            puts "Carro ligado"

            puts "informe a quantidade de marchas de progressão do veículo: "
            @quantidade=gets.chomp.to_i

            puts "informe a velocidade máxima do veículo: "
            @velocidademaxima=gets.chomp.to_i

        else
            if @ligado == false
                puts "Carro ligado"

                puts "informe a quantidade de marchas de progressão do veículo: "
                @quantidade = gets.chomp.to_i

                puts "informe a velocidade máxima do veículo: "
                @velocidademaxima = gets.chomp.to_i
            end 
        end
        

        

    end

    

    def acelerar
        if @ligado == true

            if @velocidadeatual <= @velocidademaxima
                if @marchaatual < @quantidade
                    @velocidadeatual = @velocidadeatual + 10
                    @marchaatual = @velocidadeatual / 20 + 1
                    if @velocidadeatual > @velocidademaxima 
                        puts "limite alcançado"
                                            
                    else
                        puts "A marcha é #{@marchaatual} e a velocidade é #{@velocidadeatual}"
                        

                    end
                else
                    puts "Limite alcançado"    
                end
            end
        
        else
            puts "Veículo desligado"
        end
    end

    def frear
        if @ligado == true
            if @velocidadeatual>0
                @velocidadeatual = @velocidadeatual -10
                @marchaatual = @velocidadeatual/20 + 1
                
                              
                    
                puts "A marcha atual é #{@marchaatual} e a velocidade é #{@velocidadeatual}"
            end

            if @ligado == true && @velocidadeatual == 0
               puts "Veículo parado"
            end

            
          
        end 


    end



    def desligar
        @ligado = false 

        if @ligado == false && @velocidadeatual == 0
            puts "Carro desligado"

        else
            @ligado = true
            puts "Reduza a velocidade à 0"
        end
        
    end

    


=begin    def nome
        @nome

    end



    def ligado
        @ligado=true

    end

    def marchaatual(valor)
        @marchaatual

    end

    def quantidademarchas(valor)
        @quantidademarchas

    end

    def velocidadeatual
        @velocidadeatual

    end

    def velocidademaxima
        @velocidademaxima

    end
=end

end