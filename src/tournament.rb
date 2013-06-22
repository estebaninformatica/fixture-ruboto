#!/bin/env ruby
# encoding: utf-8
class Tournament 

  attr_accessor :persons

  def name
    "Torneo"
  end

  def inicialize(p=nil)
    @persons = p
  end
  
  def set_persons_names(ps)
    @persons = ps.split(" ").map{ |name| Person.new(name) }
  end
  
  def mix
    @persons = persons.shuffle
  end

  def print_fixture(value=2)
    p "Fixture"
    persons.each_slice(value){|round|
      p "---------------" 
      round.each{|a|p a.name} 
      p "---------------"   
    }
  end

  def fixture(cantTeam=2)
    fixture = Array.new
    persons.each_slice(cantTeam){|team|
      fixture.push(team) 
    }
    return fixture
  end

end
  
