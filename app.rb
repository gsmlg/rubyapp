# -*- coding: utf-8 -*-
require 'rubygems'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'erb'
require 'json'
require './view_engines'

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
  	session.to_json
  end

  get '/menus/:name' do
  	name = params[:name]
  	getMenus name
  end

  get '/404' do
    erb :p404, :layout => false
  end

  get '/articles' do
    getAritcles nil
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
  	articles = [
  		{
  			:id => 1,
  			:title => '2013 Stack Overflow user research',
  			:date => '2013-12-31',
  			:createTime => Date.new(2013,12,31).to_time.to_i,
  			:author => 'stackoverflow',
  			:description => '<p>截止2013年，Stack Overflow社区的月访问量从2150万次增长到了2690万次，访问者分别来自全球的242个国家。为了维持社区的增长，我们做了很多的努力——Careers 2.0已经有了法语和德语两个本地化版本，我们正致力于为整个Stack Overflow网络开发iOS和Android应用，并且Stack Overflow历史上的首次本地化尝试——葡萄牙语版Stack Overflow——已经处于Beta状态。</p>'
  		},
  		{
  			:id => 2,
  			:title => 'Responsive Javascript 是什么？',
  			:date => '2014-2-19',
  			:createTime => Date.new(2014,2,19).to_time.to_i,
  			:author => 'Responsive',
  			:description => '<p>Responsive Javascript 是什么？</p><p>简单来说就是可以根据浏览器的状态做出响应。响应包括对视窗大小的反应，根据你设备是否支持触摸事件或地理定位功能来决定是否显示特定内容，不一而足。</p>'
  		},
  		{
  			:id => 3,
  			:title => '无窗设计的超音速飞机',
  			:date => '2014-2-21',
  			:createTime => Date.new(2014,2,21).to_time.to_i,
  			:author => 'Spike',
  			:description => '<p>Spike航空航天公司，Spike S- 512超音速喷气机的设计者，刚刚宣布他们计划纳入飞机设计中的另一个创新。</p><p>新的超音速喷气机将有一个革命性的无窗的客舱，这样客舱里就再也没有耀眼的阳光，也无需再拉下或打开遮光板。相反，内壁将用嵌入式的超薄显示屏覆盖。整架飞机周围的摄像头将合成壮丽的全景图在机舱屏幕上显示。乘客在睡觉的时候可以调暗屏幕，或将画面调整为存储在系统中的许多风景优美的图像之一。</p>'
  		},
  		{
  			:id => 4,
  			:title => '2013 Stack Overflow user research',
  			:date => '2013-12-31',
  			:createTime => Date.new(2013,12,31).to_time.to_i,
  			:author => 'stackoverflow',
  			:description => '<p>截止2013年，Stack Overflow社区的月访问量从2150万次增长到了2690万次，访问者分别来自全球的242个国家。为了维持社区的增长，我们做了很多的努力——Careers 2.0已经有了法语和德语两个本地化版本，我们正致力于为整个Stack Overflow网络开发iOS和Android应用，并且Stack Overflow历史上的首次本地化尝试——葡萄牙语版Stack Overflow——已经处于Beta状态。</p>'
  		},
  		{
  			:id => 5,
  			:title => 'Responsive Javascript 是什么？',
  			:date => '2014-2-19',
  			:createTime => Date.new(2014,2,19).to_time.to_i,
  			:author => 'Responsive',
  			:description => '<p>Responsive Javascript 是什么？</p><p>简单来说就是可以根据浏览器的状态做出响应。响应包括对视窗大小的反应，根据你设备是否支持触摸事件或地理定位功能来决定是否显示特定内容，不一而足。</p>'
  		},
  		{
  			:id => 6,
  			:title => '无窗设计的超音速飞机',
  			:date => '2014-2-21',
  			:createTime => Date.new(2014,2,21).to_time.to_i,
  			:author => 'Spike',
  			:description => '<p>Spike航空航天公司，Spike S- 512超音速喷气机的设计者，刚刚宣布他们计划纳入飞机设计中的另一个创新。</p><p>新的超音速喷气机将有一个革命性的无窗的客舱，这样客舱里就再也没有耀眼的阳光，也无需再拉下或打开遮光板。相反，内壁将用嵌入式的超薄显示屏覆盖。整架飞机周围的摄像头将合成壮丽的全景图在机舱屏幕上显示。乘客在睡觉的时候可以调暗屏幕，或将画面调整为存储在系统中的许多风景优美的图像之一。</p>'
  		},
  		{
  			:id => 7,
  			:title => '2013 Stack Overflow user research',
  			:date => '2013-12-31',
  			:createTime => Date.new(2013,12,31).to_time.to_i,
  			:author => 'stackoverflow',
  			:description => '<p>截止2013年，Stack Overflow社区的月访问量从2150万次增长到了2690万次，访问者分别来自全球的242个国家。为了维持社区的增长，我们做了很多的努力——Careers 2.0已经有了法语和德语两个本地化版本，我们正致力于为整个Stack Overflow网络开发iOS和Android应用，并且Stack Overflow历史上的首次本地化尝试——葡萄牙语版Stack Overflow——已经处于Beta状态。</p>'
  		},
  		{
  			:id => 8,
  			:title => 'Responsive Javascript 是什么？',
  			:date => '2014-2-19',
  			:createTime => Date.new(2014,2,19).to_time.to_i,
  			:author => 'Responsive',
  			:description => '<p>Responsive Javascript 是什么？</p><p>简单来说就是可以根据浏览器的状态做出响应。响应包括对视窗大小的反应，根据你设备是否支持触摸事件或地理定位功能来决定是否显示特定内容，不一而足。</p>'
  		},
  		{
  			:id => 9,
  			:title => '无窗设计的超音速飞机',
  			:date => '2014-2-21',
  			:createTime => Date.new(2014,2,21).to_time.to_i,
  			:author => 'Spike',
  			:description => '<p>Spike航空航天公司，Spike S- 512超音速喷气机的设计者，刚刚宣布他们计划纳入飞机设计中的另一个创新。</p><p>新的超音速喷气机将有一个革命性的无窗的客舱，这样客舱里就再也没有耀眼的阳光，也无需再拉下或打开遮光板。相反，内壁将用嵌入式的超薄显示屏覆盖。整架飞机周围的摄像头将合成壮丽的全景图在机舱屏幕上显示。乘客在睡觉的时候可以调暗屏幕，或将画面调整为存储在系统中的许多风景优美的图像之一。</p>'
  		},
  	]
  	if id
  		aritcle = articles.select {|o| o[:id] == id}
  		aritcle.first.to_json
  	else
  		articles.to_json
  	end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
