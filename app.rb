require 'sinatra/base'
require 'sinatra/reloader'
require 'haml'
require 'json'

class App < Sinatra::Base
  register Sinatra::Reloader

  set :views, root + '/app/views'
  set :haml, :format => :html5

  get '/' do
    haml :index
  end

  get '/emails' do
    headers 'Content-Type' => 'application/json'
    body [
          {id: 0, sender: 'jean@some.com', subject: 'Hi there, friend', date: '2012-12-21', recipients: ['gsm@abc.com', 'java@oracle.com'], message: 'Hey, You are the best in the World!' },
          {id: 1, sender: 'jean@some.tw', subject: 'Hi there, friend', date: '2012-12-21', recipients: ['gsm@abc.com', 'java@oracle.com'], message: 'Hey, You are the best in the World!' },
          {id: 2, sender: 'jean@some.cn', subject: 'Hi there, friend', date: '2012-12-21', recipients: ['gsm@abc.com', 'java@oracle.com'], message: 'Hey, You are the best in the World!' },
          {id: 3, sender: 'jean@some.cc', subject: 'Hi there, friend', date: '2012-12-21', recipients: ['gsm@abc.com', 'java@oracle.com'], message: 'Hey, You are the best in the World!' },
          {id: 4, sender: 'jean@some.io', subject: 'Hi there, friend', date: '2012-12-21', recipients: ['gsm@abc.com', 'java@oracle.com'], message: 'Hey, You are the best in the World!' },
         ].to_json
  end

  get '/emails/:id' do
    headers 'Content-Type' => 'application/json'
    body [
          {id: 0, sender: 'jean@some.com', subject: 'Hi there, friend', date: '2012-12-21', recipients: ['gsm@abc.com', 'java@oracle.com'], message: 'Hey, You are the best in the World!' },
          {id: 1, sender: 'jean@some.tw', subject: 'Hi there, friend', date: '2012-12-21', recipients: ['gsm@abc.com', 'java@oracle.com'], message: 'Hey, You are the best in the World!' },
          {id: 2, sender: 'jean@some.cn', subject: 'Hi there, friend', date: '2012-12-21', recipients: ['gsm@abc.com', 'java@oracle.com'], message: 'Hey, You are the best in the World!' },
          {id: 3, sender: 'jean@some.cc', subject: 'Hi there, friend', date: '2012-12-21', recipients: ['gsm@abc.com', 'java@oracle.com'], message: 'Hey, You are the best in the World!' },
          {id: 4, sender: 'jean@some.io', subject: 'Hi there, friend', date: '2012-12-21', recipients: ['gsm@abc.com', 'java@oracle.com'], message: 'Hey, You are the best in the World!' },
         ][params[:id].to_i].to_json
  end

  get '/tpl/*.html' do
    file = 'tpl/' + params[:splat].first
    if File.exists? settings.root + "/app/views/#{file}.haml"
      haml file.to_sym
    else
      halt 404
    end
  end

end
