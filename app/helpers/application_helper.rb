# Methods added to this helper will be available to all templates in the application.
require "yaml"
require "tslibrary"
module ApplicationHelper
  include Tssecur
  include ApiLink
  def window(id,title=nil, &proc)
    str =  %Q{<div id="#{id}container" style="position: relative;" class="ui-window leopard leopard_focused"><div style="z-index: 2;" class="nw">
            <div class="ne"><div  class="n "><b>#{title}</b></div></div></div><div style="z-index: 3;" class="w"><div style="position: relative;" class="e">
            <div class="content" id="#{id}">}
    concat(str,proc.binding) unless request.xhr?
    proc.call
    str =  %Q{</div></div></div><div style="z-index: 4;" class="sw"><div class="se se_resize_handle"><div class="s"></div>
            </div></div></div>}
    concat(str,proc.binding) unless request.xhr?
  end

  def submit_tag(value = "Save changes", options = {})
    or_option = options.delete(:or)
    #si nos llega or
    return super + "<span class='button_or'>" + " or " + or_option + "</span>" if or_option
    #sino
    super
  end

  def remenu
    menus = YAML::load(File.read(File.join(RAILS_ROOT,"config/menus.yml")))
    valret = menu_head
    menus.each {|k,v|
      if has_access(v[0])
        valret << '<LI class="top">' # modificado para nuevo menú
        nomen = '<span' # Agregado para nuevo menú
        if !v[3].nil?
          nomen << ' class="down"'
        end
        nomen << '>'
        nomen << k+'</span>' # Fin agregado para nuevo menú
        valret << tag_li_a(nomen,v[1],v[2],"top_link") # comentariado para nuevo menú
        if !v[3].nil?
          #valret << menu_ie(k,v[1],v[2]) # comentariado para nuevo menú
		      #valret << menu_ie("","",v[2])
          valret << '<UL class="sub">' # comentariado para nuevo menú
          v[3].each {|k2,v2|
              valret << '<LI>'
              #mentext = k2 + (v2[3].nil? ? "" : " &gt;") # comentariado para nuevo menú
              valcss = v2[3].nil? ? "" : "fly" # modificado para nuevo menú
              valret << tag_li_a(k2,v2[1],v2[2],valcss)
              if !v2[3].nil?
                  #valret << menu_ie_sub(k2,v2[1],v2[2]) # comentariado para nuevo menú
                  valret << '<UL>'
                  v2[3].each {|k3,v3|
                    valret << '<LI>'
                    valret << tag_li_a(k3,v3[1],v3[2])
                    valret << '</LI>'
                  }
                  valret << '</UL>'
                  #valret << menu_ie_fin # comentariado para nuevo menú
              end
              valret << '</LI>'
            }
          valret << '</UL>'
          #valret << menu_ie_fin # comentariado para nuevo menú
        end
        valret << '</LI>'
      end
    }
    valret << nomusu
    valret << ambiente
    valret << '</UL>'
  end
  def nomusu
    '<LI class="top">'+tag_li_a("Usu:","account","logout","top_link")+'</LI>' # comentariado para nuevo menú.    +User.find(@usuario).to_s
  end
  def ambiente
    '<LI class="top">'+tag_li_a("Amb:"+RAILS_ENV,"","","top_link")+'</LI>' # comentariado para nuevo menú
  end
  def menu_head
    '<UL id="nav">' # modificado para nuevo menú
  end
  def menu_ie(texto,link_con,link_act="")
    if texto.blank?
      '<!--[if lte IE 6]> <TABLE> <TBODY> <TR> <TD><![endif]-->'
    else
        #tmp = link_to(texto, {:controller => link_con,:action => link_act}).gsub("</a>","")
        tmp = link_to_remote(texto,:update =>"contenido",:url => {:controller => link_con,:action => link_act}).gsub("</a>","")
        '<!--[if lte IE 6]>'+tmp+'<TABLE> <TBODY> <TR> <TD><![endif]-->'
    end
  end
  def menu_ie_sub(texto,link_con,link_act="")
    #tmp = link_to(texto, {:controller => link_con,:action => link_act}).gsub("</a>","")
    tmp = link_to_remote(texto,:update =>"contenido",:url => {:controller => link_con,:action => link_act}).gsub("</a>","")
    '<!--[if lte IE 6]>'+tmp+'<TABLE> <TBODY> <TR> <TD><![endif]-->'
  end
  def tag_a(enlace,descrip)
    '<A class=hide href="'+enlace+'">'+descrip+'</A>'
  end
  def tag_li_a(texto,link_con,link_act="",link_class = "")
    if link_class.blank?
      link_to_remote(texto,:update =>"contenido",:url => {:controller => link_con,:action => link_act})
    else
      link_to_remote(texto,:update =>"contenido",:url => {:controller => link_con,:action => link_act},:html => {:class => link_class})
    end
  end
  def menu_ie_fin
    '<!--[if lte IE 6]></TD></TR></TBODY></TABLE></A><![endif]-->'
  end
  def has_access(v)
    #################
    # ESTRICTAMENTE TEMPORAL. 14 DE ABRIL DEL 2009
    #################
    return true
    encontrado=false
    if @per_users == "omnipotent"
      encontrado=true
    elsif @per_users == "system"
      encontrado=true
    else
      @per_users.split(",").each {|fila|
        encontrado=true if fila==v
      }
    end
    encontrado
  end
end
