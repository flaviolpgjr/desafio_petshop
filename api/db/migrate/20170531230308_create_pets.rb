class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :breed
      t.string :genre
      t.boolean :castrated
      t.date :birth
      t.string :name
      t.string :owner_name
      t.string :owner_phone
      t.date :last_time

      t.timestamps
    end
  end
end
