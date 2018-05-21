class CreatePersonPetExperiments < ActiveRecord::Migration[5.2]
  def change
    create_table :person_pet_experiments do |t|
      t.decimal :height
      t.decimal :weight
      t.integer :guess
      t.boolean :pass
      t.boolean :metric

      t.timestamps
    end
  end
end
