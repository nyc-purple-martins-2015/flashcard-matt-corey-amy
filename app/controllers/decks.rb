get '/decks' do
  @decks = Deck.all
  erb :'decks/index'
end

get '/decks/:id' do
  if login?
    @user_id = session[:user_id]
    @round = Round.create!(user_id: "#{@user_id}", deck_id: params[:id])
    @deck = Deck.find(params[:id])
    @cards = @deck.cards
    @cards.each do |card|
      Guess.create!(card_id: card.id, round_id: "#{@round.id}")
    end
    @round.reset_deck
  else
    redirect '/login'
  end
  erb :'decks/show'
end


