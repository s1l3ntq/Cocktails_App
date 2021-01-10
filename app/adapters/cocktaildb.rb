module Cocktaildb

    class Adapter
        BASE_URL = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s="

        attr_accessor :cocktail
        
        def initialize(cocktail)
            @cocktail = virgin_cocktail(cocktail)
        end

        def fetch_cocktails
            cocktails = JSON.parse(RestClient.get(cocktail_url))

            cocktails['drinks'].each do |drink|
                cocktail = ::Cocktail.new
                cocktail.name = drink["strDrink"]
                cocktail.ingredient1 = drink["strIngredient1"]
                cocktail.ingredient2 = drink["strIngredient2"]
                cocktail.ingredient3 = drink["strIngredient3"]
                cocktail.ingredient4 = drink["strIngredient4"]
                cocktail.ingredient5 = drink["strIngredient5"]
                cocktail.ingredient6 = drink["strIngredient6"]
                cocktail.instruction = drink["strInstructions"]
                cocktail.image = drink["strDrinkThumb"]

                cocktail.save
            end
        end

        private
           def cocktail_url
            "#{BASE_URL}#{@cocktail}"
           end

           def virgin_cocktail(cocktail)
            cocktail.gsub(/\w+/,'').downcase
           end
        end

            
    end