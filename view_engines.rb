require 'rubygems'
require 'sinatra/base'
require 'sinatra/reloader'
require 'coffee-script'
require 'compass'
require 'sass'


class SassEngine < Sinatra::Base

  set :views, settings.root + '/scss'

  set :scss, Compass.sass_engine_options
  set :scss, { :load_paths => scss[:load_paths] + [ "#{settings.root}/scss" ] }

  get '/css/*.css' do
    filename = params[:splat].first
    halt 404 unless File.exists? settings.root + '/scss/' + filename + '.scss'
    scss filename.to_sym
  end

end

class CoffeeEngine < Sinatra::Base

  set :views, settings.root + '/coffeescript'

  get "/js/app/*.js" do
    filename = params[:splat].first
    puts settings.root + '/coffeescript/' + filename + '.coffee'
    puts File.exists? settings.root + '/coffeescript/' + filename + '.coffee'
    halt 404 unless File.exists? settings.root + '/coffeescript/' + filename + '.coffee'
    coffee filename.to_sym
  end

end
