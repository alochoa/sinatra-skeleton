class Movie < ActiveRecord::Base
	has_many :reviews
	belongs_to :user
	has_many :actors
	has_many :comments
end



# 	def initialize(name, year, director, length, country)
# 		@name = name
# 		@year = year
# 		@director = director
# 		@length = length
# 		@country = country
# 	end

# 	def description
# 		puts "#{name} is a movie produced in #{country}, directed by #{director} and released in #{year}. Running time is #{length}"
# 	end
# end

# movie = Movie.new("Amadeus", "1984", "Milos Forman", "160", "USA") #160 in quotes?

# User.where(first_name: "john").first.movies.where(name:"Lighthouse Labs - Episode 6")exit
# User.find(1).movies.count
# Movie.find(1).user
# User.where(:username => "john")
# john.username
# john.first_name = "john"    how to do multiple values??
# User.create username: "test", password: "test", email: "test@test.com"
# tux -r ./config/environment.rb

# comment.movie_id = 1 ???
# Comment.find_by_comment("this is terrible").movie_id

