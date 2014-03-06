# -*- coding: utf-8 -*-
require 'rubygems'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'erb'
require 'json'
require './view_engines'

ActiveRecord::Base.table_name_prefix = 'wp_'

Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }


class App < Sinatra::Base
  set :environment, :development
  set :sessions, true
  set :views, settings.root + '/views'

  use SassEngine
  use CoffeeEngine
  use Rack::Session::Pool, :expire_after => 2592000

  register Sinatra::ActiveRecordExtension

  configure :development do
    register Sinatra::Reloader
    set :logging, true
  end

  configure :production do
  end

  configure :test do
  end

  before do
  	session[:role] = "anonymous" unless session[:role]
  end

  get '/' do
    @title = "Sinatra Web App"
    erb :index
  end

  get '/role' do
    {:role => "anonymous"}.to_json
  end

  get '/menus/:name' do
    name = params[:name]
    getMenus name
  end

  get '/404' do
    erb :p404, :layout => false
  end

  get '/articles' do
    Post.find(:all).to_json
  end

  get '/articles/:id' do
    getAritcles params[:id]
  end

  get '/addArticles' do
  end

  post '/articles' do
  end

  put '/articles/:id' do
  end

  delete '/articles/:id' do
  end

  def getMenus(name)
    {
      "head-nav"=> [
        {"name"=> "Articles", "link"=> "#articles"},
        {"name"=> "Add Article", "link"=> "#addArticle"}
      ]
    }[name].to_json
  end

  def getAritcles(id)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
