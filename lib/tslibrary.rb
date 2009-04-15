#*******************************************************************************
#Diverso modulos para uso con los menus dinámicos
# y para manejo de la seguridad en active_scaffold
#
#
# Autor:  Benjamín Cárdenas Salamandra
#
#*******************************************************************************

module Tspermisos
  protected
  def autoriz(vsAccion)
    act_perm
    if session[:admints] or session[:omnipotent]
      return true
    end
    case vsAccion
      when "create"
        session[@nombre_modulo][:permisos_roles].insertar
      when "update"
        session[@nombre_modulo][:permisos_roles].modificar
      when "delete"
        session[@nombre_modulo][:permisos_roles].eliminar
      when "show"
        session[@nombre_modulo][:permisos_roles].mostrar
    end
  end
  def act_perm
    if !defined? session[@nombre_modulo] or session[@nombre_modulo].nil?
      session[@nombre_modulo] = Hash.new
    end
    if !defined? session[@nombre_modulo][:permisos_roles] or session[@nombre_modulo][:permisos_roles].nil?
      session[@nombre_modulo][:permisos_roles] = User.act_permisos(@nombre_modulo,session[:user])
    end
#     if !defined? session[@nombre_modulo][:rol] or session[@nombre_modulo][:rol].nil?
#       session[@nombre_modulo][:rol] = User.act_perrol(session[:user])
#     end
    if !defined? session[:admints] or session[:admints].nil?
      session[:admints] = User.act_perrol(session[:user]).system_role
    end
    if !defined? session[:omnipotent] or session[:omnipotent].nil?
      session[:omnipotent] = User.act_perrol(session[:user]).omnipotent
    end
  end
end

module Tssecur
  def has_access(modulo)
    #get session
    if !defined? @session[modulo] or @session[modulo].nil?
      @session[modulo] = Hash.new
    end
    if !defined? @session[modulo][:permisos_roles] or @session[modulo][:permisos_roles].nil?
      @session[modulo][:permisos_roles] = PermisosRol.new
    end
    permiso_id = nil
    modulo = Permiso.find_by_modulo(modulo)
    if modulo.nil? or modulo.blank?
      return false
    else
      permiso_id = modulo.id
    end
    if !defined? @session[modulo][:rol] or @session[modulo][:rol].nil?
      @session[modulo][:rol] = Rol.new
    end
    rol = User.find(session[:user]).rol
    session[modulo][:rol] = rol unless rol.nil? rescue nil
    permisos_roles = User.find(session[:user]).rol.permisos_roles.find_by_permiso_id(permiso_id) rescue nil
    @session[modulo][:permisos_roles] = permisos_roles unless permisos_roles.nil?
    if @session[modulo][:rol].omnipotent
      return true
    elsif @session[modulo][:rol].system_role
      return true
    end
    #logger.log
    #session[:user][:id]
    @session[modulo][:permisos_roles].acceso
  end
end

module TsGen
  def padl(cStr_tmp,nLong,cChar)
    cStr_tmp.strip!
    vnLen = cStr_tmp.length
    if vnLen >= nLong
      return cStr_tmp
    end
     cChar*(nLong-vnLen)+cStr_tmp
  end
end
