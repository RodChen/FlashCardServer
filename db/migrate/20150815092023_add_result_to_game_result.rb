class AddResultToGameResult < ActiveRecord::Migration
  def change
    add_column :game_results, :result, :string
  end
end
