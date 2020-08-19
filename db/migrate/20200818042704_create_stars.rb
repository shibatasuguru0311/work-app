class CreateStars < ActiveRecord::Migration[6.0]
  def change
    create_table :stars do |t|
      t.references :user, foreign_key: true
      t.references :work, foreign_key: true
      t.timestamps
    end
  end
end
