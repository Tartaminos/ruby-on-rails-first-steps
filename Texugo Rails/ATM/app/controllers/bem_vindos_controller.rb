class BemVindosController < ApplicationController
    def create
        BemVindo.create(params[:bem_vindo])
        redirect_to root_path
    end
    def index
        
    end
end