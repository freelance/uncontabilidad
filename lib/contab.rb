#*******************************************************************************
#Clase Numlet crea objetos los cuales son convertidos a su respectiva
# representaciòn en texto a traves del metodo  a_letra
# p.e
# 2734 = dos mil setecientos treinta y cuatro
#
# Las conversiones se realizan con numeros entre:
# 0 y 999,999,999
#
# Autor:  Faustino Vasquez limon
# Con ayuda de  http://www.ruby-doc.org/
#
#Asi que "COMIENZA EL DESPAPAYE"
#*******************************************************************************
class Numlet
  def initialize(numero)
    @numero = numero.to_s.reverse.split("")
    @i = 0
    @j = 0
    @parte1 = []
    @parte2 = []
    @especial = ""
    @numlet = []
    @bandera=0
    @bandera1=0
    @a =[["uno","dos","tres","cuatro","cinco","seis","siete","ocho","nueve"],
      ["diez","veinte","treinta","cuarenta","cincuenta","sesenta","setenta","ochenta","noventa"],       
      ["ciento","doscientos","trescientos","cuatrocientos","quinientos","seiscientos","setecientos","ochocientos","novecientos"]]
  end

  def especial 
    @numlet[@j]  = case @especial
    when "11"then  "once"
    when "12"then  "doce"
    when "13"then  "trece"
    when "14"then  "catorce"
    when "15"then  "quice"
    when "16"then  "dieciseis"
    when "17"then  "diecisiete"
    when "18"then  "dieciocho"
    when "19"then  "diecinueve"
    when "21"then  "veintiun"
    when "22"then  "veintidos"
    when "23"then  "veintitres"
    when "24"then  "veinticuatro"
    when "25"then  "veinticinco"
    when "26"then  "veintiseis"
    when "27"then  "veintisite"
    when "28"then  "veintiocho"
    when "29"then  "veintinueve"
    else return 0
    end
  end

  def repetir
    case @numero.length
    when 0..3 then @parte1[0] = @numero[0..@numero.length]
    when 4..6 then @parte1[0] = @numero[0..2];@parte1[1] = @numero[3..@numero.length]
    when 7..9 then @parte1[0] = @numero[0..2];@parte1[1] = @numero[3..5]; @parte1[2] = @numero[6..@numero.length]
    else return 0
    end
  end

  def convierte
    @bandera1=0
    @i=0
    case @bandera
    when 1 then @numlet[@j]="mil";@j+=1
    when 2 then (@parte2.length==1 and @parte2[0]==1) ? @numlet[@j]="millon" : @numlet[@j]="millones";@j+=1
    end
    @especial = [@parte2[@i+1],@parte2[@i]].to_s
    if especial != 0
      @i+=2
      @j+=1
    else
      if @parte2[@i].to_s =="1"
        @numlet[@j]="un"
        @i+=1
        @j+=1
      end
    end
    while @i < @parte2.length
      if @parte2[@i].to_i ==0
        @i+=1
        @bandera1+=1
      else
        if @parte2.length != 1 and @bandera1 ==0
          if @i == 1
            @numlet[@j]="y"
            @j+=1
          end
        end
        @numlet[@j] = @a[@i][@parte2[@i].to_i-1]
        if  @i == 2  and @bandera1==2 and @numlet[@j]=="ciento"
          @numlet[@j]="cien"
        end
        @j+=1
        @i+=1    
      end
    end
    @bandera+=1
  end

  def termina
    @numlet.reverse.join(" ")
  end

  def a_letra
    if  repetir != 0
      @parte1.each do |@parte2|
        convierte
      end
        print "#{termina}\n"
    else
      print "Este numero no puede ser convertido\n"
    end
   end
end

#Por si alguien quiere aventarse la revisada de todos los numeros
#~ 1.upto(999999999) do |x|
#~ anum = Numlet.new(x)
#~ anum.a_letra
#~ end