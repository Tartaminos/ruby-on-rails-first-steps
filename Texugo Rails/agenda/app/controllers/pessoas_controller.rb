class PessoasController < ApplicationController
    
    def create
        Pessoa.create(params[:pessoa])
        redirect_to root_path
    
    end

    def new

        @pessoa = Pessoa.new
    
    end

    def index
        @pessoa = Pessoa.all
    
    end

    def show

        @pessoa = Pessoa.find_by_id(params[:id])
    end

    def update
        @pessoa = Pessoa.find_by_id(params[:id])
        @pessoa.update_attributes(params[:pessoa])
        redirect_to root_path


    end

    def edit
        @pessoa = Pessoa.find_by_id(params[:id])
    end

    def destroy
        @pessoa = Pessoa.find_by_id(params[:id])
        @pessoa.destroy
        redirect_to root_path
    end
end