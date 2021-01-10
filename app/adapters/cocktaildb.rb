module Cocktaildb

    class Adapter
        BASE_URL = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s="

        attr_accessor :cocktail
        
        def initialize(cocktail)
            @cocktail = virgin_cocktail(cocktail)
        end

        def fetch_cocktails
            cocktails = JSON.parse(RestClient.get(BASE_URL))

            cocktails['drinks'].each do |drink|
                cocktail = ::Cocktail.new
                cocktail.name = drink["strDrink"]
                cocktail.ingredient = drink["strIngredient"]
                cocktail.instruction = drink["strInstructions"]
                cocktail.image = drink["strDrinkThumb"]

                cocktail.save
            end
        end

        private
           def virgin_cocktail(cocktail)
            cocktail.gsub(/\w+/,'').downcase
           end
        end

            
    end