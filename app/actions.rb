# Homepage (Root path)
helpers do
	def current_user
		@current_user = User.find_by(id: session[:user_id]) if session[:user_id]
	end
end

before do
  redirect '/login' if !current_user && request.path != '/login' && request.path != '/signup'
end

get '/' do
	@movies = Movie.all.reverse
    erb :index
end

get '/login' do
    erb :login
end

get '/profile' do
	erb :profile
end

get '/signup' do
	erb :signup
end

post '/login' do
	email = params[:email]
	password = params[:password]

	user = User.find_by(email: email)
	if user.password == password
		session[:user_id] = user.id
    	redirect '/'
	else
		redirect '/login'
	end
end

post '/signup' do
	first_name = params[:first_name]
	last_name = params[:last_name]
	email = params[:email]
	password = params[:password]
	howdid = params[:howdid]

	user = User.find_by(email: email)
	if user
		redirect '/signup'
	else
		user = User.create(first_name: first_name, last_name: last_name, email: email, password: password, howdid: howdid)
		session[:user_id] = user.id
	redirect '/'
	end 
end

post 'profile' do
	redirect '/'
end

get '/movies/create' do
	erb :movie_new
end

post '/movies/create' do 
	name = params[:name]
	year = params[:year]
	director = params[:director]
	length = params[:length]
	country = params[:country]
	genre = params[:genre] 
	# binding.pry
	movie = Movie.find_by(name: name)
	if movie 
		redirect '/movies/create'
	else
		movie = current_user.movies.create(name: name, year: year, director: director, length: length, country: country, genre: genre)
		if movie 
		redirect "/movies/#{movie.id}"
		else
			erb :movie_new
		end
	end
end

# to ask
get '/movies' do
	erb :movies
end	

get '/movies/:id' do
	@movie = Movie.find(params[:id])
	erb :movie_show
end

get '/movies/:id/edit' do
	@movie = Movie.find(params[:id])
	erb :edit_movie
end

post '/movies/:id/update' do
	name = params[:name]
	year = params[:year]
	director = params[:director]
	length = params[:length]
	country = params[:country]
	genre = params[:genre] 

	movie = Movie.find(params[:id])

	movie.update_attributes name: name, year: year, director: director, length: length, country: country, genre: genre

	redirect "/movies/#{movie.id}"
end

get '/profile/edit' do
	current_user
	erb :profile
end

post '/profile/edit' do
	first_name = params[:first_name]
	last_name = params[:last_name]
	email = params[:email]
	password = params[:password]
	gender = params[:gender]

	current_user.update first_name: first_name, last_name: last_name, email: email, password: password, gender: gender
	redirect '/'
end

get '/movies/:id/comment_new' do
	@movie = Movie.find params[:id]
	erb :comment_new
end

post "/movies/:id/comment_new" do
	comment = params[:comment]
	@movie = Movie.find params[:id]
	@movie.comments.create(comment: comment, user_id: current_user.id)
	redirect "/movies/#{params[:id]}"
end

get '/logout' do
	# Delete all session variables for this user
	session.clear
	
	# Redirect them back to login
	redirect '/login'
end
