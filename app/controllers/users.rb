get '/signup' do
  erb :'users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

get '/login' do
  erb :'users/login'
end

post '/login' do
  user = User.find_by(username: params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = ["Incorrect username or password."]
    erb :'users/login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  @played_rounds = @user.rounds.all
  @decks = @user.decks_played
  erb :'users/show'
end
