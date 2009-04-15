#!/usr/bin/ruby

require 'rubygems'
require 'fileutils'


ENV["RAILS_ENV"] ||= "development"
require File.dirname(__FILE__) + "/../config/environment"

#[100, 32,43,2121].each do |value|
 begin
 t =Transaction.new
 u= t.unit_transactions.build(t.from_id =11;  t.to_id = 12;  t.value = 100;)
  
 t.save;
  end



  
   
