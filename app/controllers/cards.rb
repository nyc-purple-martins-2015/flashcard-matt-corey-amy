get '/card/:id' do
  @card = Card.find(params[:id])
  @deck = Deck.find_by(id: "#{@card.deck_id}")
  @round = Round.find_by(deck_id: "#{@deck.id}")
  erb :'cards/view_card'
end

post '/card/:id' do
  @card = Card.find(params[:id])
  @deck = Deck.find_by(id: "#{@card.deck_id}")
  @cards = @deck.cards
  @round = Round.find_by(deck_id: "#{@deck.id}")
  @guess = Guess.create!(card_id: params[:id], round_id: "#{@round.id}")
  @count = @guess.count
  @answer = params[:answer]
  if @card.answer == @answer
    @count += 1
    @guess.update_attributes(correctness: true, count: @count)
    binding.pry
      if @round.round_over?
        redirect '/'
      else
        redirect "/card/#{@round.cards_left.sample.card_id}"
      end
  else
    @count += 1
    @guess.update_attributes(count: @count)
    redirect "/card/#{@round.cards_left.sample.card_id}"
  end
end


=begin

I think we need to find or assign a current user or round(using auth_helper method?)

@cards_left = @round.guesses.where(correctness: "false")
@correct_cards = @round.guesses.where(correctness: "true")


  if @card.answer == @answer
    @count + = 1
    @guess.update_attributes(correctness: true, count: @count)
      if round_over?
        redirect to game over page that links to stats?
      else
        redirect "/card/#{@round.cards_left.sample.card_id}"
      end
  else
    @count += 1
    @guess.update_attributes(count: @count)
    redirect "/card/##{@round.cards_left.sample.card_id}"
  end







=end


