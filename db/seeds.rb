# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient = JSON.parse(ingredient_serialized)

Ingredient.destroy_all

ingredient["drinks"].each do |i|
  Ingredient.create(name: i["strIngredient1"])
end

puts "Ingredient Seed OK"

Cocktail.all.each do |cocktail|
  new_cocktail = Cocktail.new(name: cocktail.name, photo: cocktail.photo)
  cocktail.destroy
  new_cocktail.save
end

puts "Cocktail Seed OK"
