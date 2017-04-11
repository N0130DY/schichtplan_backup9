class CreateMitarbeiters < ActiveRecord::Migration[5.0]
  def change
    create_table :mitarbeiters do |t|
      t.string :text
      t.datetime :start_date
      t.integer :duration
      t.integer :parent
      t.string :status
      t.string :user
      t.integer :user_id

      t.timestamps
    end
  end
end
