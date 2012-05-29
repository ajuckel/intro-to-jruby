class CreateActionItems < ActiveRecord::Migration
  def change
    create_table :action_items do |t|
      t.string :name
      t.string :description
      t.integer :action_category_id
      t.timestamps
    end
  end
end
