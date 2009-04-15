class InicioController < ApplicationController
  #layout "main"
  def inicio
    #render :inline "Hola Mundo"
  end

  def generales
    @menu_lat = "menuinicio"
    @nombre_modulo = "Inicio"
  end

  def act_perm
    @nombre_modulo = "Inicio"
    super
  end
  def create_authorized?
    autoriz("create")
  end
  def update_authorized?
    autoriz("update")
  end
  def delete_authorized?
    autoriz("delete")
  end
  def show_authorized?
    autoriz("show")
  end
end