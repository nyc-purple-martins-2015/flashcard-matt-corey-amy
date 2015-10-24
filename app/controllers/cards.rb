get '/card/:id' do
  @card = Card.find(params[:id])
  @deck = Deck.find_by(id: "#{@card.deck_id}")
  @round = Round.find_by(deck_id: "#{@deck.id}")
  erb :'cards/view_card'
end

post '/card/:id' do
  @card = Card.find(params[:id])
  @deck = Deck.find_by(id: "#{@card.deck_id}")
  @round = Round.where(deck_id: "#{@deck.id}").last
  @card_guess = Guess.find_by(card_id: params[:id], round_id: "#{@round.id}")
  @count = @card_guess.count
  @answer = params[:answer]
  if @card.answer == @answer
    @count += 1
    @card_guess.update_attributes(correctness: true, count: @count)
      if @round.round_over?
        redirect '/'
      else
        redirect "/card/#{@round.cards_left.sample.card_id}"
      end
  else
    @count += 1
    @card_guess.update_attributes(count: @count)
    redirect "/card/#{@round.cards_left.sample.card_id}"
  end
end


