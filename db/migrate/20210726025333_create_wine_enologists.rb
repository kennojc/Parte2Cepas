class CreateWineEnologists < ActiveRecord::Migration[6.1]
  def change
    create_table :wine_enologists do |t|
      t.integer :score
      t.references :wine, null: false, foreign_key: true
      t.references :enologist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
