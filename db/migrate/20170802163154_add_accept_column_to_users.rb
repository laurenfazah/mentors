class AddAcceptColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :accepting_mentees, :boolean, default: false
  end
end
