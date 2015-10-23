get '/decks' do
  erb :'decks/index'
end

get '/decks/:id' do
  @card = Card.find_by(deck_id: params[:id])
  @deck = Deck.find(params[:id])
  erb :'decks/show'
end
