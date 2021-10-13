# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  product1 = Product.new(name: Faker::Coffee.blend_name, price: Faker::Number.decimal(l_digits: 2), image_url: Faker::Internet.url(host: 'example.com', path: '/foobar.jpg'), description: Faker::Coffee.notes)
  product1.save
end