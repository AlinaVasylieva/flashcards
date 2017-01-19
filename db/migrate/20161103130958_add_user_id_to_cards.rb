class AddUserIdToCards < ActiveRecord::Migration[5.0]
  def change
    #add_column :cards, :user_id, :integer
    add_column :cards, :deck_id, :integer
  end
end
