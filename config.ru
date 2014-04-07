require './app'
require 'sprockets'
require 'sass'
require 'coffee-script'

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'app/assets/'
  environment.append_path 'lib/assets/'
  environment.append_path 'vendor/assets/'
  run environment
end

map '/' do
  run App
end
