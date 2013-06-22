#!/usr/local/bin/ruby
require_relative "person"
require_relative "tournament"
a = Person.new("juan")
b = Person.new("carlos")
c = Person.new("jon")
d = Person.new("damina")
e = Person.new("raul")
f = Person.new("peter")
g = Person.new("Gordo")
h = Person.new("pepe")
persons = [a,b,c,d,e,f,g,h]
torneo = Tournament.new()
torneo.set_persons_names("juan carlos jon damina raul peter Gordo pepe")
torneo.mix
p torneo.fixture
torneo.fixture("3".to_i).each{|team |
  p  "\n---------------------------\n "
  team.each{|k|
    p  " \n#{k.name}\n "
    }
  }