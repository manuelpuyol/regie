# frozen_string_literal: true

require 'pry'
require 'dotenv'
require_relative 'app/app'

begin
  Dotenv.load('.env')

  app = App::App.new
  app.start
rescue Interrupt
  puts "\nStopping now"
end
