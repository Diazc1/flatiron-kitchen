class Recipe < ActiveRecord::Base
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients

	validates :name, presence: true

	def ingredients_to_dishes

		available_quantities = ingredients.pluck(:quantity)

		total_dishes = 0

		if available_quantities.present?

			until available_quantities.include?(0)
				available_quantities.map!{|q| q - 1} 
				total_dishes += 1
			end

		end

		total_dishes
	end

	def ingredients_quantities_sum
		ingredients.pluck(:quantity).sum
	end
end