class AddEmailToMitarbeiters < ActiveRecord::Migration[5.0]
  def change
    add_column :mitarbeiters, :email, :string
  end
end
