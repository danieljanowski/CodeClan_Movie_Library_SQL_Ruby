require_relative('models/casting')
require_relative('models/movie')
require_relative('models/star')

require('pry-byebug')

Movie.delete_all
Star.delete_all
Casting.delete_all

movie1 = Movie.new({'title' => 'Die Hard', 'genre' => 'action', 'budget' => 10000000})
movie1.save

movie2 = Movie.new({'title' => 'Matrix', 'genre' => 'sci-fi', 'budget' => 12000000})
movie2.save

movie2.title = "Matrix 2"
movie2.update

star1 = Star.new({'first_name' => 'Bruce', 'last_name' => 'Willis'})
star1.save

star2 = Star.new({'first_name' => 'Alan', 'last_name' => 'Rickman'})
star2.save

star3 = Star.new({'first_name' => 'Joel', 'last_name' => 'Silver'})
star3.save

star4 = Star.new({'first_name' => 'Jess', 'last_name' => 'Mcnab'})
star4.save

star5 = Star.new({'first_name' => 'Laurence', 'last_name' => 'Fishburne'})
star5.save

star6 = Star.new({'first_name' => 'Hugo', 'last_name' => 'Weaving'})
star6.save

casting1 = Casting.new({'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => 1000000})
casting1.save

casting2 = Casting.new({'movie_id' => movie1.id, 'star_id' => star2.id, 'fee' => 500000})
casting2.save

casting3 = Casting.new({'movie_id' => movie1.id, 'star_id' => star3.id, 'fee' => 600000})
casting3.save

casting4 = Casting.new({'movie_id' => movie1.id, 'star_id' => star4.id, 'fee' => 80000})
casting4.save

casting5 = Casting.new({'movie_id' => movie2.id, 'star_id' => star5.id, 'fee' => 2000000})
casting5.save

casting6 = Casting.new({'movie_id' => movie2.id, 'star_id' => star6.id, 'fee' => 1500000})
casting6.save

casting7 = Casting.new({'movie_id' => movie2.id, 'star_id' => star4.id, 'fee' => 600000})
casting7.save

binding.pry

nil
