class CreatePhotosGroups < ActiveRecord::Migration
  def change
    create_table :photos_groups do |t|
      t.string :title
      t.integer :parent_id
      t.string :pic
      t.integer :orderby
      t.references :admin_users

      t.timestamps
    end
    add_index :photos_groups, :admin_users_id
  end
end
