# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  include AuthenticatedSystem
  # You can move this into a different controller, if you wish.  This module gives you the require_role helpers, and others.
  include RoleRequirementSystem

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery :secret => 'c9dce6e5f339842d79513c254e4e8aa6'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  # Ingresado 14 de abril del 2009 Benjamín Cárdenas Salamandra
  #layout :sel_lay
  prepend_before_filter :ensure_db_connection_active
  #before_filter :login_required, :except => [ :login,:logout ] #,:inicio
  append_before_filter :localize
  before_filter :set_charset_pro
  ActiveScaffold::Localization.lang = "es-es"
  ActiveScaffold.set_defaults do |config|
    #config.security.default_permission = false
    config.security.current_user_method = :current_user
  end
  
  def set_charset_pro
     if headers['Content-Type'] =~ /;/
        #@headers['Content-Type'] = $`+';charset=ISO-8859-1'
        headers['Content-Type'] = $`+';charset=UTF-8'
     end
     #response.headers['Content-Type'] = 'text/html; charset=iso-8859-1'
  end

  def ensure_db_connection_active
    unless ActiveRecord::Base.connection.active?
      unless ActiveRecord::Base.connection.reconnect!
        raise "La base de datos no esta disponible"
      end
    end
  end

  def localize
    #ActiveScaffold::Localization.lang = session[:locale_code]
    #Localize.to session[:locale_code]
    #Localize.to "es-es"
    ActiveScaffold::Localization.lang = "es-es"
  end

  def sel_lay
    # Se le puede colocar una lógica compleja según el usuario
    return "menulateral" if @menu_lat.blank?
    @menu_lat
  end
end