# encoding: UTF-8
class UsuariosController < ApplicationController

    def create
        @usuario = Usuario.create(params[:usuario])
        if @usuario.save
            redirect_to (@usuario)
        else
            render "new"
        end
    end

    def new
        @usuario = Usuario.new
    
    end

    def index
        if @usuario_logado.gerente
            @usuarios = Usuario.all
        else
            redirect_to bem_vindos_path
        end
    end

    def show
        @usuario = Usuario.find_by_id(params[:id])
    end

    def update
        @usuario = Usuario.find_by_id(params[:id])
        if @usuario.update_attributes(params[:usuario])
            redirect_to root_path
        else
            render "edit"
        end

    end

    def edit
        @usuario = Usuario.find_by_id(params[:id])
        
    end

    def destroy
        @usuario = Usuario.find_by_id(params[:id])
        @usuario.destroy
        redirect_to root_path
    end
    def login
        @usuario = Usuario.find_by_email(params[:email])
        @retorno = @usuario.validou?(params[:senha]) if @usuario
        if @retorno
            cookies.signed[:id] = @usuario.id
            redirect_to bem_vindos_path
        else
            @erro = "email ou senha incorretos"
            render "mostrar_login" 
            
        end
    end
    def deslogar
        cookies.delete :id
        redirect_to root_path

    end
end