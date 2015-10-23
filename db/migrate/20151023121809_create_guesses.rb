class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer  :card_id
      t.integer  :round_id
      t.boolean  :correctness, default: false
      t.integer  :count, default: 0

      t.timestamps null: false
    end
  end
end
