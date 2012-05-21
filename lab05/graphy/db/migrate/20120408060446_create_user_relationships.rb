class CreateUserRelationships < ActiveRecord::Migration
  def change
    create_table :user_relationships do |t|
      t.references :user, :friend
      t.timestamps
    end
  end
end
