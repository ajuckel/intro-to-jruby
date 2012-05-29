class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.string :name
      t.string :description
      t.integer :min_rating
      t.integer :max_rating

      t.timestamps
    end
  end
end
