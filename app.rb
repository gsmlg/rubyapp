require 'rubygems'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/reloader' if development?
require 'erb'
require 'json'

Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }

class App < Sinatra::Base
	set :environment, :development
	set :sessions, true

	register Sinatra::ActiveRecordExtension

	configure :development do
		register Sinatra::Reloader
		set :logging, true
	end

	configure :production do
	end

	configure :test do
	end

	set :database, 'sqlite:///db/posts.sqlite3'

	get '/' do
		erb :index
	end

	get '/404' do
		erb :p404, :layout => false
	end

	get '/articles' do
		Post.all.to_json
	end

	get '/articles/:id' do
		Post.find(:first, params[:id])
	end

	get '/addArticles' do
		erb :addPost
	end

	post '/articles' do
		Post.create(:title => params[:title], :content => params[:content])
		params.to_json
	end

	put '/articles/:id' do
		Post.update(params[:id], :title => params[:title], :content => params[:content])
	end

	delete '/articles/:id' do
		Post.delete(params[:id])
	end


	# start the server if ruby file executed directly
	run! if app_file == $0

end
