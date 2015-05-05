class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :movie

	# def user
	# 	User.find_by(id: self.user_id)
	# end

	# def movie
	# 	Movie.find_by(id: self.movie_id)
	# end
end

# comment = Comment.first

# commment.user
# # < User id: 1, comment: "something they said", movie_id: 5 >

# commment.user.id
# # 1