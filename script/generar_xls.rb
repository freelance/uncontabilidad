  require 'rubygems'
  require 'roo'

  
 HOURLY_RATE = 123.45
  
  oo = Openoffice.new("simple_spreadsheet.ods")
 #oo = Excel.new("simple_spreadsheet.xls")

  oo.default_sheet = oo.sheets.first
  4.upto(12) do |line|
    date  = oo.cell(line,'A')
    start_time = oo.cell(line,'B')
    end_time  = oo.cell(line,'C')
    pause  = oo.cell(line,'D')
    #sum  = (end_time - start_time) - pause
    comment  = oo.cell(line,'F')
    #amount  = sum * HOURLY_RATE
    if date
      puts "#{date}\t#{comment}"
    end
 end
