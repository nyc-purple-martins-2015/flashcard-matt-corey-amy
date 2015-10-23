get '/card/:id' do
  @deck = Deck.find_by(params[:id])
  @card = Card.find(params[:id])
  erb :'cards/view_card'
end

post '/card/:id' do
  @card = Card.find(params[:id])
  @guess = Guess.create!(card_id: params[:id], round_id: 1) #What do we need to do with round_id
  @count = @guess.count
  @answer = params[:answer]
  if @card.answer == @answer
    @count += 1
    @guess.update_attributes(correctness: true, count: @count)
    redirect "/" #we need to redirect to random card that has not been correctly answered
  else
    @count += 1
    @guess.update_attributes(count: @count)
    redirect "/"
  end
end
