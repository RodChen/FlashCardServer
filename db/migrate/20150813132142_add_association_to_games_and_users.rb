class AddAssociationToGamesAndUsers < ActiveRecord::Migration
  def change
    create_table :games_users, id: false do |t|
      t.belongs_to :game, index: true
      t.belongs_to :user, index: true
    end
  end
end
