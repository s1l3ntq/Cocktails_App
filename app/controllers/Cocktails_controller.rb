

class CocktailsController < ApplicationController
    get '/cocktails/new' do #create
        erb :'/cocktails/new'
    end

    post '/cocktails' do #create
        cocktail = Cocktail.new(params)
        if !cocktail.name.empty? && !cocktail.ingredient1.empty?
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
        @cocktail = Cocktail.find(params['id'])
        erb :'/cocktails/show'
    end
    get '/cocktails/:id/edit' do
        @cocktail = Cocktail.all.find(params['id'])
        erb :'/cocktails/edit'
    end
    
end