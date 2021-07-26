class CreateEnologistMagazines < ActiveRecord::Migration[6.1]
  def change
    create_table :enologist_magazines do |t|
      t.integer :role
      t.references :enologist, null: false, foreign_key: true
      t.references :magazine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
