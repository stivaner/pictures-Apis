class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.references :group
      t.text :description
      t.string :pic
      t.integer :orderby

      t.timestamps
    end
    add_index :photos, :group_id
  end
end
