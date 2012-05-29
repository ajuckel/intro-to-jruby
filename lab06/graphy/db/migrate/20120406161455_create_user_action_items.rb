class CreateUserActionItems < ActiveRecord::Migration
  def change
    create_table :user_action_items do |t|
      t.references :user
      t.references :action_item
      t.timestamps 
    end
    add_index :user_action_items, :user_id
    add_index :user_action_items, :action_item_id
  end
end
