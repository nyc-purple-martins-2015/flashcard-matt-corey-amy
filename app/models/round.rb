class Round < ActiveRecord::Base
  has_many :guesses
  belongs_to :deck
  has_many :cards, through: :deck
  belongs_to :user

  def cards_left
    card = Card.all
    self.guesses.where(correctness:"false")
  end

  def correct_cards
    self.guesses.where(correctness: "true")
  end

  def round_over?
    self.guesses.where(correctness:"false").length == 0
  end

  def reset_deck
    self.guesses.update_all(correctness: "false", count: 0)
  end
end
