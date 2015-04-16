class User < ActiveRecord::Base
	has_many :movies
	has_many :reviews
	has_many :comments
	
	# def initialize(first_name, last_name, username, email, password, gender, howdid) 
	# #needed, if activer record mention it
	# 	@first_name = first_name
	# 	@last_name = last_name
	# 	@username = username
	# 	@email = email
	# 	@password = password
	# 	@gender = gender
	# 	@howdid = howdid
	# end

	# def fullname
	# 	user:[first_name]+" "+user:[:last_name]
	# # def login 
end
