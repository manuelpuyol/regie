# frozen_string_literal: true

require 'pry'
require_relative 'app/app'

begin
  app = App::App.new
  app.start
rescue Interrupt
  puts "\nStopping now"
end
