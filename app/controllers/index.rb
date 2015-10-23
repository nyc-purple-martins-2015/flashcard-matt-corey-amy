get '/' do
  redirect '/decks'
end

get '/card/:id' do
  # @deck = Deck.new
  @card = Card.new
  @guess = Guess.new
  erb :view_card

end

post 'card/:id' do
@deck = Deck.find_by(id: @card.deck_id)
@card = Card.find_by(params[:id])
@guess = Guess.create!(card_id: params[:id], round_id: 1)
@response = params(:response)
# if @card.answer == @response
#   @guess.update_attributes(correctness: true, count: += 1)

#   # redirect "/card/#{@deck.cards.sample.id}"
#   #how do we want to handle this? redirect to a random card id that has a false attribute?
# else
#   @guess.update_attributes(count: += 1)
#   #same redirect as above
# end
end
