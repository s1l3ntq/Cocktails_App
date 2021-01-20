class CocktailsController < ApplicationController

    get '/cocktails/new' do #create
        erb :'/cocktails/new'
    end

    post '/cocktails' do #create
        
        cocktail = Cocktail.new(params)
        if !cocktail.name.empty? && !cocktail.ingredient1.empty?
            cocktail.user_id = session[:user_id] 
            cocktail.save
            redirect '/cocktails'
        else
            @error = "User must input Title and Ingredients to continue."
            erb :'/cocktails/new'
        end
    end

    get '/cocktails' do #Read
        @cocktails = Cocktail.all.reverse
        erb :'/cocktails/index'
    end

    get '/cocktails/:id' do #Read

        @cocktail = Cocktail.find(params[:id])
        erb :'/cocktails/show'
    end
    
    get '/cocktails/:id/edit' do
        if logged_in?
        @user = self.current_user
        @cocktail = Cocktail.find(params[:id])
    
        erb :'/cocktails/edit'
        end
    end

    patch '/cocktails/:id' do
        @cocktail = Cocktail.find(params[:id])
        
        @cocktail.update(name: params["name"], ingredient1: params["ingredient1"], instruction: params["instruction"], image: params["image"])
        redirect '/cocktails'
    end

    delete '/cocktails/:id' do
        @cocktail = Cocktail.find(params[:id])
        @cocktail.destroy
        redirect '/cocktails'
    end

    # private 
    # def redirect_if_not_authorized
    
    #     if User.id(:id) != current_user
    #         redirect '/'
    #     end
    # end
    
end



#     get '/cocktails/new' do #create
#         login_check
#         erb :'/cocktails/new'
#     end

#     post '/cocktails' do #create
#         # redirect_if_not_logged_in
#         cocktail = Cocktail.new(params)
#         if !cocktail.name.empty? && !cocktail.ingredient1.empty?
#             cocktail.user_id = session[:user_id] 
#             cocktail.save
#             redirect '/cocktails'
#         else
#             @error = "User must input Title and Ingredients to continue."
#             erb :'/cocktails/new'
#         end
#     end



#     get '/cocktails' do #Read
#         @cocktails = Cocktail.all.reverse
#         login_check
#         erb :'/cocktails/index'
#     end

#     get '/cocktails/:id' do #Read
#         @cocktail = current_cocktail
#         login_check
#         erb :'/cocktails/show'
#     end
    
#     get '/cocktails/:id/edit' do
#         @user = self.current_user
#         @cocktail = current_cocktail
#         login_check
#         erb :'/cocktails/edit'
#     end

#     patch '/cocktails/:id' do
#         @cocktail = current_cocktail
#         login_check
#         @cocktail.update(name: params["name"], ingredient1: params["ingredient1"], instruction: params["instruction"], image: params["image"])
#         redirect '/cocktails'
#     end

#     delete '/cocktails/:id' do
#         @cocktail = current_cocktail
#         @cocktail.destroy
#         redirect '/cocktails'
#     end

#     helpers do
        
#    def show_error
#        puts "User must input Title and Ingredients to continue."
#     end
# end
 
    

# end