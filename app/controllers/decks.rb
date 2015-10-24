get '/decks' do
  @decks = Deck.all
  erb :'decks/index'
end

get '/decks/:id' do  #it is currently set up so that if you are not logged in, you cannot select a deck
  if session[:user_id]
    @user_id = session[:user_id]
    @round = Round.create!(user_id: "#{@user_id}", deck_id: params[:id])
    @card = Card.find_by(deck_id: params[:id])
    @deck = Deck.find(params[:id])
    @guess = Guess.create!(card_id: params[:id], round_id: "#{@round.id}")
    @round.reset_deck
  else
    #right now I am redirecting to login if you are not a current user
    redirect '/login'
  end
  erb :'decks/show'
end


