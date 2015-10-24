def login?
  !!session[:user_id]
end

def current_user
  User.all.find_by(id: session[:user_id])
end
