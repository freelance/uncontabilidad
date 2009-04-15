    #!/usr/bin/ruby

    require 'rubygems'
    require 'gruff'

    g = Gruff::Line.new
    g.title = "Mi gráfica de prueba"

    g.data("Java", [24, 25, 18])
    g.data("C", [17.5, 17, 16.5])
    g.data("PHP", [4, 3.5, 9.5])
    g.data("Python", [1, 6.5, 2.5])

    g.labels = {0 => '2003', 1 => '2004', 2 => '2005'}

    g.write('prueba.png')
