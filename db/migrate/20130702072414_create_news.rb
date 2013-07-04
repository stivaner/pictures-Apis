class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :announce
      t.text :body
      t.boolean :publication
      t.date :date_publication
      t.string :hard_title
      t.string :link

      t.timestamps
    end
  end
end
