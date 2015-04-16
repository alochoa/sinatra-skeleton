# Homepage (Root path)
helpers do
	def current_user
		@current_user = User.find_by(id: session[:user_id]) if session[:user_id]
	end
end

get '/' do
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
		redirect '/movies/new'
	else
		movie = Movie.create(name: name, year: year, director: director, length: length, country: country, genre: genre)
		redirect '/movies'
	end
end
