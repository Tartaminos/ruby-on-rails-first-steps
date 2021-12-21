class VeiculosController < ApplicationController
    def index
        @veiculos = Veiculo.all
    end

    def show
        @veiculo = Veiculo.find_by_id(params[:id])
    end
    
    def new
       @veiculo = Veiculo.new 
    end
    def create
       Veiculo.create(params[:veiculo])
       redirect_to root_path
               
    end
    def edit
        @veiculo = Veiculo.find_by_id(params[:id])
    end

    def update
        @veiculo = Veiculo.find_by_id(params[:id])
        @veiculo.update_attributes(params[:veiculo])
        redirect_to root_path

    end
    def destroy
        @veiculo = Veiculo.find_by_id(params[:id])
        @veiculo.destroy
        redirect_to root_path
    end

    def ligar
        @veiculo = Veiculo.find_by_id(params[:id])
        @veiculo.ligar
        redirect_to @veiculo
    end

    def desligar
        @veiculo = Veiculo.find_by_id(params[:id])
        @veiculo.desligar
        redirect_to @veiculo
    end

    def acelerar
        @veiculo = Veiculo.find_by_id(params[:id])
        @veiculo.acelerar
        redirect_to @veiculo
    end

    def frear
        @veiculo = Veiculo.find_by_id(params[:id])
        @veiculo.frear
        redirect_to @veiculo
    end
end