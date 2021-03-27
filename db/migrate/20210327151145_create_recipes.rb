class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :meal
      t.string :picture
      t.text :recipe

      t.timestamps
    end
  end
end
