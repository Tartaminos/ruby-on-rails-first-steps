class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :logado, :except => [:login, :mostrar_login]
  before_filter :seguranca, :except => [:login, :mostrar_login]
  def logado
    @usuario_logado = Usuario.find_by_id(cookies.signed[:id])
  end

  def seguranca
    if @usuario_logado 
        
    else
        redirect_to root_path
    end
  end
end
