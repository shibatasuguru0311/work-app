class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.string :name,               null: false
      t.text   :introduction,       null: false
      t.string :address,            null: false
      t.string :url
      t.string :photo,              null: false
      t.timestamps
    end
  end
end
