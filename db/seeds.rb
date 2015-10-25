corey = User.create!(username: "cgrad01", password: "password" )
amy = User.create!(username: "amyliao", password: "password")
matt = User.create!(username: "coolmatt", password: "password")

addition = Deck.create!(name: "addition")

add_card1 = Card.create!(deck_id: "#{addition.id}", question: "What is 2+2?", answer: "4")
add_card2 = Card.create!(deck_id: "#{addition.id}", question: "What is 3+3?", answer: "6")
add_card3 = Card.create!(deck_id: "#{addition.id}", question: "What is 4+4?", answer: "8")
add_card4 = Card.create!(deck_id: "#{addition.id}", question: "What is 5+5?", answer: "10")
add_card5 = Card.create!(deck_id: "#{addition.id}", question: "What is 6+6?", answer: "12")

subtraction = Deck.create!(name: "subtraction")

sub_card1 = Card.create!(deck_id: "#{subtraction.id}", question: "What is 4-2?", answer: "2")
sub_card2 = Card.create!(deck_id: "#{subtraction.id}", question: "What is 6-3?", answer: "3")
sub_card3 = Card.create!(deck_id: "#{subtraction.id}", question: "What is 8-4?", answer: "4")
sub_card4 = Card.create!(deck_id: "#{subtraction.id}", question: "What is 10-5?", answer: "5")
sub_card5 = Card.create!(deck_id: "#{subtraction.id}", question: "What is 12-6?", answer: "6")

multiplication = Deck.create!(name: "multiplication")

mult_card1 = Card.create!(deck_id: "#{multiplication.id}", question: "What is 4*2?", answer: "8")
mult_card2 = Card.create!(deck_id: "#{multiplication.id}", question: "What is 6*3?", answer: "18")
mult_card3 = Card.create!(deck_id: "#{multiplication.id}", question: "What is 8*4?", answer: "32")
mult_card4 = Card.create!(deck_id: "#{multiplication.id}", question: "What is 10*5?", answer: "50")
mult_card5 = Card.create!(deck_id: "#{multiplication.id}", question: "What is 12*6?", answer: "72")

