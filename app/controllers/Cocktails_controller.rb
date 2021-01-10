

class CocktailsController < ApplicationController


    get '/cocktails' do
        @cocktails = Cocktail.all
        erb :'/cocktails/index'
    end
    
end