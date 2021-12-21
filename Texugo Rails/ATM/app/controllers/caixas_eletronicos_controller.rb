class CaixasEletronicosController < ApplicationController

    def create
        CaixaEletronico.create(params[:caixa_eletronico])
        redirect_to root_path
    
    end

    def new
        @caixa_eletronico = CaixaEletronico.new

    end

    def index
        @caixa_eletronico = CaixaEletronico.all

    end

    def show
        @caixa_eletronico = CaixaEletronico.find_by_id(params[:id])
        
    end
    
    def update
        @caixa_eletronico = CaixaEletronico.find_by_id(params[:id])
        @caixa_eletronico.update_attributes(params[:caixa_eletronico])
        if @caixa_eletronico.save
            redirect_to @caixa_eletronico
        else
            render "edit"
        end

    end

    def edit
        @caixa_eletronico = CaixaEletronico.find_by_id(params[:id])
    end

    def destroy
        @caixa_eletronico = CaixaEletronico.find_by_id(params[:id])
        @caixa_eletronico.destroy
        redirect_to root_path
    end

    def mostrar
        @caixa_eletronico = CaixaEletronico.find_by_id(params[:id])
    end

    def abastecer 
        @caixa_eletronico = CaixaEletronico.find_by_id(params[:id])
        @caixa_eletronico.update_attributes(params[:caixa_eletronico])
        
    end

    def sacar
        @caixa_eletronico = CaixaEletronico.find_by_id(params[:id])
        @retorno = @caixa_eletronico.sacar(params[:valor_saque].to_i)
    end

    def mostrar_saque
        @caixa_eletronico = CaixaEletronico.find_by_id(params[:id])
    end
    
end