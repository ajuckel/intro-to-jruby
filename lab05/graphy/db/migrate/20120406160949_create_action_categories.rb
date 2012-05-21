class CreateActionCategories < ActiveRecord::Migration
  def change
    create_table :action_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
