class User < ActiveRecord::Base
  has_many :rounds
  has_many :guesses, through: :rounds
  has_many :decks, through: :rounds

  has_secure_password

  def count_rounds
    self.rounds.count
  end

  def decks_played
    @decks = []
    self.rounds.each do |round|
      @decks << round.deck
    end
    @decks.sort
  end
end
