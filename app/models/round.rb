class Round < ActiveRecord::Base
  has_many :guesses
  belongs_to :deck
  has_many :cards, through: :deck
  belongs_to :user
end
