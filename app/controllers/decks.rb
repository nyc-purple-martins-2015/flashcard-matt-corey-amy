get '/decks' do
  erb :'decks/index'
end

get '/decks/:id' do
  @user_id = session[:id]
  @card = Card.find_by(deck_id: params[:id])
  @deck = Deck.find(params[:id])
  @round = Round.create!(user_id: "#{@user_id}", deck_id: params[:id])
  erb :'decks/show'
end
