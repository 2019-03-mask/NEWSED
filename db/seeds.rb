# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Artist.create!(artist_name:'mr.children')
Genre.create!(genre_name:'J-POP')
Lable.create!(lable_name:'Toys Factory')
Item.create!(item_name:'栄光の架橋', genre_id:1, lable_id:1, artist_id:1, stock:10, price:100)