class User < ActiveRecord::Base
  has_secure_password

  has_many :rounds
  has_many :guesses, through: :rounds
  has_many :decks, through: :rounds

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

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
