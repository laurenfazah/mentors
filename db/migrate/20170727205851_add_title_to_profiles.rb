class AddTitleToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :title, :string
  end
end
