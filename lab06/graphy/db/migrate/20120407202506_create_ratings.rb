class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :user_action_item
      t.references :metric
      t.integer :week_number
      t.integer :value
      t.string :pros
      t.string :cons
      t.timestamps
    end
    add_index :ratings, :user_action_item_id
    add_index :ratings, :metric_id
  end
end
