class Cocktail < ActiveRecord::Base
    belongs_to :user
    validates :name, presence: true
    validates :ingredient1, presence: true

end