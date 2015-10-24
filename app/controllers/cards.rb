get '/card/:id' do
  @card = Card.find(params[:id])
  @deck = Deck.find_by(id: "#{@card.deck_id}")
  @round = Round.find_by(deck_id: "#{@deck.id}")
  erb :'cards/view_card'
end

post '/card/:id' do
  @next_card = params[:id].to_i + 1 #comment this out
  @card = Card.find(params[:id])
  @deck = Deck.find_by(id: "#{@card.deck_id}")
  @round = Round.find_by(deck_id: "#{@deck.id}")
  @guess = Guess.create!(card_id: params[:id], round_id: "#{@round.id}")
  @count = @guess.count
  @answer = params[:answer]
  if @card.answer == @answer
    @count += 1
    @guess.update_attributes(correctness: true, count: @count)
    redirect "/card/#{@next_card}" #we need to redirect to random card that has not been correctly answered
  else
    @count += 1
    @guess.update_attributes(count: @count)
    redirect "/"
  end
end


