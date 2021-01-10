

class CocktailsController < ApplicationController
    get '/cocktails/new' do
        erb :'/cocktails/new'
    end

    post '/cocktails' do
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
        @cocktails = Cocktail.all
        erb :'/cocktails/index'
    end

    get '/cocktails/:id' do #Read
        @cocktail = Cocktail.find(params['id'])
        erb :'/cocktails/show'
    end
    
end