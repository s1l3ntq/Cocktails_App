class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        @user = User.new(params)
        if @user.save
            session[:user_id] = @user.id
            redirect '/cocktails'
        else
            @error = @user.errors.full_messages
            erb :'users/signup'
        end
    end
        get '/login' do
            erb :'users/login'
        end

    post '/login' do
       
         user = User.find_by(username: params[:username])
        #   binding.pry
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/cocktails'
        else
            @error = "Username or Password are incorrect. Please try again."
            erb :'users/login'
    
        end
    end

    get '/logout' do
            session.destroy
            redirect '/'
        end
end