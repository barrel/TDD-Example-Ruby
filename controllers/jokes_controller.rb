# index
get '/jokes' do
	@jokes = Joke.all
	erb :'jokes/index'
end

# new
get '/jokes/new' do
  erb :'jokes/new'
end

# create
post '/jokes' do
  joke = Joke.new(params[:joke])
  
  if joke.save
    redirect '/jokes'
  end
end