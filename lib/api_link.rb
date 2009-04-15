#*******************************************************************************
#Diverso modulos para crear elementos css especiales
#
# Autor:  Benjamín Cárdenas Salamandra
#
#*******************************************************************************

module ApiLink
  def li(identificacion,contenido)
    ret_li = identificacion.blank? ? "<li>" : "<li id='#{identificacion}'>"
    ret_li << contenido
    ret_li << "</li>"
  end
  
  def link_remoto(nombre,controlador,accion,actualiz,html_options = nil,val_id=nil)
    actualiz = "contenido" if  actualiz.blank?
    link_to_remote(nombre,:update =>actualiz,:url => {:controller => controlador,
      :action => accion,:id => val_id},:html => html_options)
  end
  
  def li_remoto(nombre,controlador,accion,identific,actualiz,html_options = nil,val_id=nil)
    li(identific,link_remoto(nombre,controlador,accion,actualiz,html_options,val_id))
  end
end

module ApiBoxRnd
  def box_head(ident=nil,estilo=nil)
    h1 = "<div class='xsnazzy'"
    h1 << " style='#{estilo}'" if !estilo.blank?
    h1 << " id='#{ident}'" if !ident.blank?
    h1 << ">"
    h1 << "<b class='xtop'><b class='xb1'></b><b class='xb2'></b><b class='xb3'></b><b class='xb4'></b></b>"
    h1 << "<div class='xboxcontent'>"
    h1
  end
  def box_foot
    h1 = "</div>"
    h1 << "<b class='xbottom'><b class='xb4'></b><b class='xb3'></b><b class='xb2'></b><b class='xb1'></b></b>"
    h1 << '</div>'
    h1
  end
  def box_rnd(vcTexto,ident=nil,estilo=nil)
    box_head(ident,estilo)+vcTexto+box_foot
  end
end



