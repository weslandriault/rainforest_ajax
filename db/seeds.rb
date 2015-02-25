# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def big_catchphrase
	Faker::Company.catch_phrase + " by " +
	Faker::Company.name + " that will " +
	Faker::Company.bs + ". " +
	Faker::Company.catch_phrase + ". " +
	Faker::Company.catch_phrase
end

User.create!({
  email: "example@bitmakerlabs.com",
  name: "Example User",
  password: "pass",
  password_confirmation: "pass"
  }
)

100.times do
	Product.create!(
		name: Faker::Commerce.product_name,
		description: big_catchphrase,
		price_in_cents: rand(10000)
		)
	print "|"
end
