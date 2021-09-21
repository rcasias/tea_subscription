class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :customer, foreign_key: true
      t.belongs_to :tea, foreign_key: true
      t.boolean :is_active, :default => true
      t.integer :frequency

      t.timestamps
    end
  end
end
