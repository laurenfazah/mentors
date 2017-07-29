class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :bio
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
