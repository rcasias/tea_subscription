class AddPriceToTea < ActiveRecord::Migration[6.1]
  def change
    add_column :teas, :price, :integer
  end
end
