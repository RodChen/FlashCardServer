class CreateGameResults < ActiveRecord::Migration
  def change
    create_table :game_results do |t|
      t.integer :game_id
      t.integer :user_id
      t.integer :problem_id
      t.boolean :correct
      t.integer :consumed_time

      t.timestamps
    end
  end
end
