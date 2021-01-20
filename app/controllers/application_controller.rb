require './config/environment'


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

  not_found do
    redirect '/login'
  end
  
  # error do
  #   # not_user_object
  #   erb :'/'
  # end


  helpers do  #allows our views to access these methods 
    def logged_in?
        !!session[:user_id]
    end

    def login_check
      unless logged_in? 
        redirect '/login'
      end
    end
  
    def current_user   #memoization
    @current_user ||=  User.find(session[:user_id]) if session[:user_id]
  end
  
    def current_cocktail
      Cocktail.find_by_id(params[:id])
    end
 end

 
 private 
 def redirect_if_not_logged_in
     if !logged_in?
         redirect '/login'
     end
 end



def missing_cocktail
  unless current_cocktail != nil
    redirect '/cocktails'
  end
end
end


