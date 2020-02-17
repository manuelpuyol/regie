# frozen_string_literal: true

require 'pry'
require_relative 'core'

begin
  app = App::App.new
  app.start
rescue Interrupt
  puts "\nStopping now"
end
