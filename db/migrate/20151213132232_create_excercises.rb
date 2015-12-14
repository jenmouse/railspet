class CreateExcercises < ActiveRecord::Migration
   def change
    create_table :exercises do |t|
      t.string :name
      t.integer :calories
      t.references :pet, index: true, foreign_key: true
      t.timestamps
    end
  end
end
