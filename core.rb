# frozen_string_literal: true

Dir[File.join(__dir__, 'db', '**', '*.rb')].sort.each do |file|
  puts file
  require file
end
Dir[File.join(__dir__, 'app', '**', '*.rb')].sort.each do |file|
  puts file
  require file
end
Dir[File.join(__dir__, 'authentication', '**', '*.rb')].sort.each do |file|
  puts file
  require file
end
Dir[File.join(__dir__, 'registration', '**', '*.rb')].sort.each do |file|
  puts file
  require file
end
