# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
	Product.create!(
		name: Faker::Commerce.product_name,
		description: Faker::Company.catch_phrase,
		price_in_cents: rand(10000)

		)
	print "|"
end
