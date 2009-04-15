

#!/usr/bin/ruby

require 'rubygems'
require 'gruff'
require 'fileutils'


ENV["RAILS_ENV"] ||= "development"
require File.dirname(__FILE__) + "/../config/environment"

@accounts = Account.find(:all)

g = Gruff::Line.new('500x500')
g.title = "Cuentas" 

g.theme = {
  :colors => ['#638AA5', '#E9C904', '#000066', '#B4B4B4'],
  :font_color => '#000000',
  :font_size => 12,
  :marker_color => '#dddddd',
  :background_colors => ['#ffffff', '#ffffff'],
}

g.font = File.expand_path('artwork/fonts/VeraBd.ttf', RAILS_ROOT)
g.legend_font_size = 12
g.marker_font_size = 12
g.legend_box_size = 12

#qué se ve y qué no
g.hide_title = false
g.hide_legend = false


@accounts.each do |account|
  g.data(account.name, [account.balance])
end 


g.labels = {0 => 'Enero', 2 => 'Febrero', 4 => 'Marzo',6 =>'Abril'}

image_path = Rails.root + "/public/images/graphs"
FileUtils.mkpath(image_path)
g.write(image_path+'/my_account_graph.png')

#
# En tu app haces:
# <%= image_tag("graphs/my_account_graph.png") %>
#
