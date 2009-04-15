#!/usr/bin/ruby

require 'rubygems'
require 'gruff'


ENV["RAILS_ENV"] ||= "development"
require File.dirname(__FILE__) + "/../config/environment"

@accounts = Account.find(:all)

g = Gruff::Line.new
g.title = "Cuentas" 

 for account in @accounts 
  	
		g.data("account.name", [account.balance])
				
			
 end 


g.labels = {0 => 'Enero', 2 => 'Febrero', 4 => 'Marzo'}

g.write('/images/my_account_graph.png')



#g.data("Activo", [1, 82, 3, 4, 4, 3])
#g.data("Pasivo", [4, 8, 7, 9, 8, 9])
#g.data("Ventas", [2, 3, 1, 5, 6, 8])
#g.data("Caja", [9, 9, 10, 8, 7, 9])

#g.labels = {0 => 'Enero', 2 => 'Febrero', 4 => 'Marzo'}

#g.write('my_account_graph.png')
