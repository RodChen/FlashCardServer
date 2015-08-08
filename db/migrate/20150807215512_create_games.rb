class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :stock_id
      t.integer :num_of_words
      t.integer :player1_id
      t.integer :player2_id

      t.timestamps
    end
  end
end
