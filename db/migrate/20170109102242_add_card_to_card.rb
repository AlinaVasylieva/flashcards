class AddCardToCard < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :card, :string
  end
end
