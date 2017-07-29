class DeleteCompanyReferenceOnUser < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:users, :company, index: true)
  end
end
