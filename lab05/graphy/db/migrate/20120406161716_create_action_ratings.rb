class CreateActionRatings < ActiveRecord::Migration
  def change
    create_table :action_ratings do |t|
      t.references :action
      t.references :user
      t.integer :rating
      t.string :pros
      t.string :cons

      t.timestamps
    end
    add_index :action_ratings, :action_id
    add_index :action_ratings, :user_id
  end
end
