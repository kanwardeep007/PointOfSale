# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Creating the items
Item.create({name: "Coffee",price: 100})
Item.create({name: "Tea",price: 75})
Item.create({name: "Chicken Sandwich",price: 150})
Item.create({name: "Chocolate Cake",price: 125})
Item.create({name: "Veg Sandwich",price: 125})

arr = ["Coffee","Beverage","Tea","Sandwich","Food","Bread","Non-veg","Chicken","Chocolate","Cake","Dessert","Veg"]

# Creating tags
arr.each do |tag|
  Tag.create({name: "#{tag}"})
end

# Creating associations between tags and items
Item.find_by_name("Coffee").tags << (Tag.find_by_name("Coffee"))
Item.find_by_name("Coffee").tags << (Tag.find_by_name("Beverage"))
Item.find_by_name("Tea").tags << (Tag.find_by_name("Beverage"))
Item.find_by_name("Tea").tags << (Tag.find_by_name("Tea"))
Item.find_by_name("Chicken Sandwich").tags << (Tag.find_by_name("Chicken"))
Item.find_by_name("Chicken Sandwich").tags << (Tag.find_by_name("Non-veg"))
Item.find_by_name("Chicken Sandwich").tags << (Tag.find_by_name("Bread"))
Item.find_by_name("Chicken Sandwich").tags << (Tag.find_by_name("Food"))
Item.find_by_name("Chicken Sandwich").tags << (Tag.find_by_name("Sandwich"))
Item.find_by_name("Chocolate Cake").tags << (Tag.find_by_name("Cake"))
Item.find_by_name("Chocolate Cake").tags << (Tag.find_by_name("Dessert"))
Item.find_by_name("Chocolate Cake").tags << (Tag.find_by_name("Chocolate"))
Item.find_by_name("Veg Sandwich").tags << (Tag.find_by_name("Veg"))
Item.find_by_name("Veg Sandwich").tags << (Tag.find_by_name("Bread"))
Item.find_by_name("Veg Sandwich").tags << (Tag.find_by_name("Food"))
Item.find_by_name("Veg Sandwich").tags << (Tag.find_by_name("Sandwich"))
