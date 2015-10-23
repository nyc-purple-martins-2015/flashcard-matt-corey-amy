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
  erb :login
end

post '/login' do
  @user = User.find_by(username: params[:user][:username])
  if @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    redirect '/login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
