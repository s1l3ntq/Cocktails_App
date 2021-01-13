require './config/environment'
require 'rubygems'
require 'sinatra'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "Idrink"
  end

  get "/" do
    
    erb :welcome
  end


  # get '/logout' do
  #   session.destroy
  #   redirect '/'
  # end
end
